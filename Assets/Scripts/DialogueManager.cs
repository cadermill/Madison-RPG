using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using UnityEngine.SceneManagement;
using System.Collections;
using System.Collections.Generic;

public class DialogueManager : MonoBehaviour
{
    [SerializeField] private TextAsset inkAsset;
    [SerializeField] private Canvas canvas;
    [SerializeField] private TMP_Text dialogueText;
    [SerializeField] private Button[] choiceButtons;
    [SerializeField] private string day;

    [Header("Typewriter Settings")]
    [SerializeField] private float typingSpeed = 0.04f;

    [Header("Typing Audio")]
    [SerializeField] private AudioSource typingAudioSource;
    [SerializeField] private AudioClip typingClip;

    private static DialogueManager _instance;

    private bool isTyping = false;
    private string fullText = "";
    private Coroutine typingCoroutine;
    private bool choicesDisplayed = false;
    private CanvasManager canvasManager;
    private bool dayEnded = false;
    private bool waitingForMinigame = false;
    private string savedBackground = "";
    private string savedCharacter = "";
    private string postMinigameLine = "";
    private float inputCooldown = 0f;
    private const float INPUT_COOLDOWN_DURATION = 0.5f;

    Story _inkStory;

    private Dictionary<string, string> minigameScenes = new Dictionary<string, string>()
    {
        { "minigame_trivia_monday",    "Minigame_Trivia_Monday"    },
        { "minigame_trivia_tuesday",   "Minigame_Trivia_Tuesday"   },
        { "minigame_trivia_wednesday", "Minigame_Trivia_Wednesday" },
        { "minigame_trivia_thursday",  "Minigame_Trivia_Thursday"  },
        { "minigame_trivia_friday",    "Minigame_Trivia_Friday"    },
        { "minigame_doomscroll",       "Minigame_Doomscroll"       },
        { "minigame_coffee",           "Minigame_Coffee"           },
        { "minigame_frat",             "Minigame_Frat_1"           },
    };

    // ── Lifecycle ────────────────────────────────────────────────────
    void Awake()
    {
        if (_instance != null && _instance != this)
        {
            Destroy(gameObject);
            return;
        }
        _instance = this;
        DontDestroyOnLoad(gameObject);
        _inkStory = new Story(inkAsset.text);
        EnterDialogue();
    }

    void OnEnable()  { SceneManager.sceneLoaded += OnSceneLoaded; }
    void OnDisable() { SceneManager.sceneLoaded -= OnSceneLoaded; }

    void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        canvasManager = FindFirstObjectByType<CanvasManager>();

        if (waitingForMinigame && !minigameScenes.ContainsValue(scene.name))
        {
            waitingForMinigame = false;
            ApplyMinigameResults();
            ResumeDialogue();
        }
    }

    // ── Input ────────────────────────────────────────────────────────
    private void Update()
    {
        if (waitingForMinigame) return;

        if (inputCooldown > 0f)
        {
            inputCooldown -= Time.deltaTime;
            return;
        }

        if (Input.GetMouseButtonDown(0))
        {
            if (isTyping) { SkipTypewriter(); return; }

            if (canvasManager != null) canvasManager.hideCharacter();

            if (_inkStory.canContinue)
            {
                string line = _inkStory.Continue();
                bool launchingMinigame = processTags();
                if (!launchingMinigame)
                    StartTypewriter(line);
            }
            else if (_inkStory.currentChoices.Count > 0)
            {
                if (!choicesDisplayed)
                {
                    for (int i = 0; i < _inkStory.currentChoices.Count; ++i)
                    {
                        Choice choice = _inkStory.currentChoices[i];
                        choiceButtons[i].gameObject.SetActive(true);
                        choiceButtons[i].GetComponentInChildren<TMP_Text>().text = choice.text;
                    }
                    choicesDisplayed = true;
                }
                processTags();
            }
            else { ExitDialogue(); }
        }
    }

    // ── Tags ─────────────────────────────────────────────────────────
    private bool processTags()
    {
        bool launchingMinigame = false;

        foreach (string tag in _inkStory.currentTags)
        {
            Debug.Log(tag);

            if (tag.Contains("location"))
            {
                canvasManager?.changeBackground(tag.Split("location_")[1]);
            }
            else if (tag.Contains("character"))
            {
                canvasManager?.displayCharacter(tag.Split("character_")[1]);
            }
            else if (minigameScenes.TryGetValue(tag.Trim(), out string sceneName))
            {
                LaunchMinigame(sceneName, tag.Trim());
                launchingMinigame = true;
            }
        }

        return launchingMinigame;
    }

    // ── Minigame ─────────────────────────────────────────────────────
    private void LaunchMinigame(string sceneName, string minigameId)
    {
        GameSession.Clear();
        GameSession.lastMinigameId = minigameId;
        GameSession.returnScene = SceneManager.GetActiveScene().name;

        if (canvasManager != null)
        {
            savedBackground = canvasManager.GetCurrentBackground();
            savedCharacter  = canvasManager.GetCurrentCharacter();
        }

        postMinigameLine = _inkStory.canContinue ? _inkStory.Continue() : "";

        waitingForMinigame = true;
        canvas.gameObject.SetActive(false);
        SceneManager.LoadScene(sceneName);
    }

    private void ApplyMinigameResults()
    {
        int score = GameSession.lastMinigameScore;
        string id  = GameSession.lastMinigameId;

        switch (id)
        {
            case "minigame_trivia_monday":
            case "minigame_trivia_tuesday":
            case "minigame_trivia_wednesday":
            case "minigame_trivia_thursday":
            case "minigame_trivia_friday":
                if (score == 5)
                {
                    _inkStory.variablesState["ending_perfect_student"] =
                        (int)_inkStory.variablesState["ending_perfect_student"] + 3;
                }
                else if (score >= 3)
                {
                    _inkStory.variablesState["ending_perfect_student"] =
                        (int)_inkStory.variablesState["ending_perfect_student"] + 1;
                }
                _inkStory.variablesState["actions_taken"] =
                    (int)_inkStory.variablesState["actions_taken"] + 1;
                break;

            case "minigame_doomscroll":
                if (score <= 0)
                {
                    _inkStory.variablesState["ending_burnt_out"] =
                        (int)_inkStory.variablesState["ending_burnt_out"] + 2;
                    _inkStory.variablesState["actions_taken"] =
                        (int)_inkStory.variablesState["actions_taken"] + 2;
                }
                else if (score < 200)
                {
                    _inkStory.variablesState["ending_average"] =
                        (int)_inkStory.variablesState["ending_average"] + 1;
                    _inkStory.variablesState["actions_taken"] =
                        (int)_inkStory.variablesState["actions_taken"] + 1;
                }
                else
                {
                    _inkStory.variablesState["ending_burnt_out"] =
                        (int)_inkStory.variablesState["ending_burnt_out"] + 1;
                    _inkStory.variablesState["actions_taken"] =
                        (int)_inkStory.variablesState["actions_taken"] + 2;
                }
                break;

            case "minigame_coffee":
                if (score >= 5)
                {
                    _inkStory.variablesState["ending_barista"] =
                        (int)_inkStory.variablesState["ending_barista"] + 3;
                    _inkStory.variablesState["friendship_barista"] =
                        (int)_inkStory.variablesState["friendship_barista"] + 2;
                }
                else if (score >= 3)
                {
                    _inkStory.variablesState["ending_barista"] =
                        (int)_inkStory.variablesState["ending_barista"] + 1;
                    _inkStory.variablesState["friendship_barista"] =
                        (int)_inkStory.variablesState["friendship_barista"] + 1;
                }
                _inkStory.variablesState["actions_taken"] =
                    (int)_inkStory.variablesState["actions_taken"] + 1;
                break;

            case "minigame_frat":
                if (score == 1)
                {
                    _inkStory.variablesState["ending_party"] =
                        (int)_inkStory.variablesState["ending_party"] + 2;
                    _inkStory.variablesState["friendship_frat_bro"] =
                        (int)_inkStory.variablesState["friendship_frat_bro"] + 2;
                    _inkStory.variablesState["actions_taken"] =
                        (int)_inkStory.variablesState["actions_taken"] + 2;
                }
                break;
        }

        GameSession.Clear();
    }

    private void ResumeDialogue()
    {
        canvas.gameObject.SetActive(true);
        inputCooldown = INPUT_COOLDOWN_DURATION;

        if (canvasManager != null)
        {
            if (!string.IsNullOrEmpty(savedBackground))
                canvasManager.changeBackground(savedBackground);
            if (!string.IsNullOrEmpty(savedCharacter))
                canvasManager.displayCharacter(savedCharacter);
        }

        if (!string.IsNullOrEmpty(postMinigameLine))
        {
            StartTypewriter(postMinigameLine);
            postMinigameLine = "";
        }
        else if (_inkStory.canContinue)
        {
            string line = _inkStory.Continue();
            processTags();
            StartTypewriter(line);
        }
        else { ExitDialogue(); }
    }

    // ── Typewriter ───────────────────────────────────────────────────
    private void StartTypewriter(string text)
    {
        fullText = text;
        if (typingCoroutine != null) StopCoroutine(typingCoroutine);
        typingCoroutine = StartCoroutine(TypewriterRoutine(text));
    }

    private IEnumerator TypewriterRoutine(string text)
    {
        isTyping = true;
        dialogueText.text = "";
        if (typingClip) { typingAudioSource.clip = typingClip; typingAudioSource.Play(); }
        foreach (char c in text)
        {
            dialogueText.text += c;
            yield return new WaitForSeconds(typingSpeed);
        }
        if (typingAudioSource.isPlaying) typingAudioSource.Stop();
        isTyping = false;
    }

    private void SkipTypewriter()
    {
        if (typingCoroutine != null) StopCoroutine(typingCoroutine);
        dialogueText.text = fullText;
        if (typingAudioSource.isPlaying) typingAudioSource.Stop();
        isTyping = false;
    }

    // ── Choices ──────────────────────────────────────────────────────
    public void makeChoice(int idx)
    {
        _inkStory.ChooseChoiceIndex(idx);
        for (int i = 0; i < choiceButtons.Length; ++i)
            choiceButtons[i].gameObject.SetActive(false);

        _inkStory.Continue();

        if (_inkStory.canContinue)
        {
            string line = _inkStory.Continue();
            processTags();
            StartTypewriter(line);
        }
        else { ExitDialogue(); }

        choicesDisplayed = false;
    }

    // ── Enter / Exit ─────────────────────────────────────────────────
    public void EnterDialogue(string knot = "start")
    {
        canvas.gameObject.SetActive(true);
        _inkStory.ChoosePathString(knot);
        string line = _inkStory.Continue();
        processTags();
        StartTypewriter(line);
    }

    private void ExitDialogue()
    {
        canvas.gameObject.SetActive(false);
        dialogueText.text = "";

        if ((int)_inkStory.variablesState["actions_taken"] >= 10)
        {
            if (!dayEnded) { EnterDialogue("day_over"); dayEnded = true; }
            else
            {
                SceneManager.LoadScene("Dorm_End_" + day);
                Destroy(FindFirstObjectByType<SceneLoader>().gameObject);
                Destroy(gameObject);
            }
        }
    }
}

public static class GameSession
{
    public static int lastMinigameScore = 0;
    public static string lastMinigameId = "";
    public static string returnScene = "";

    public static void Clear()
    {
        lastMinigameScore = 0;
        lastMinigameId = "";
    }
}