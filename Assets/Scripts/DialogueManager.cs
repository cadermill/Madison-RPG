using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using UnityEngine.SceneManagement;
using System.Collections; // ← ADDED

public class DialogueManager : MonoBehaviour
{
    [SerializeField] private TextAsset inkAsset;
    [SerializeField] private Canvas canvas;
    [SerializeField] private TMP_Text dialogueText;
    [SerializeField] private Button[] choiceButtons;

    // ── Typewriter fields ───────────────────────────────────────────
    [Header("Typewriter Settings")]
    [SerializeField] private float typingSpeed = 0.04f;

    [Header("Typing Audio")]
    [SerializeField] private AudioSource typingAudioSource;
    [SerializeField] private AudioClip typingClip;

    private bool isTyping = false;
    private string fullText = "";
    private Coroutine typingCoroutine;
    // ────────────────────────────────────────────────────────────

    private bool choicesDisplayed = false;
    private CanvasManager canvasManager;
    Story _inkStory;

    void Awake()
    {
        DontDestroyOnLoad(gameObject);
        _inkStory = new Story(inkAsset.text);

        EnterDialogue();
    }

    void OnEnable() { SceneManager.sceneLoaded += OnSceneLoaded; }
    void OnSceneLoaded(Scene scene, LoadSceneMode mode) { canvasManager = FindFirstObjectByType<CanvasManager>(); }
    void OnDisable() { SceneManager.sceneLoaded -= OnSceneLoaded; }

    private void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            // ──skip typewriter on click ───────────────────────────
            if (isTyping) { SkipTypewriter(); return; }
            // ───────────────────────────────────────────────────

            canvasManager.hideCharacter();

            if (_inkStory.canContinue)
            {
                string line = _inkStory.Continue();
                processTags();
                StartTypewriter(line); //dialogueText.text = _inkStory.Continue();
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

    //Typewriter methods ──────────────────────────────────────────
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

        if (typingClip)
        {
            typingAudioSource.clip = typingClip;
            typingAudioSource.Play();
        }

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
    // ────────────────────────────────────────────────────────────

    private void processTags()
    {
        for (int i = 0; i < _inkStory.currentTags.Count; ++i)
        {
            string tag = _inkStory.currentTags[i];
            Debug.Log(tag);
            if (tag.Contains("location")) { canvasManager.changeBackground(tag.Split("location_")[1]); }
            else if (tag.Contains("character")) { canvasManager.displayCharacter(tag.Split("character_")[1]); }
        }
    }

    public void makeChoice(int idx)
    {
        _inkStory.ChooseChoiceIndex(idx);
        for (int i = 0; i < choiceButtons.Length; ++i) { choiceButtons[i].gameObject.SetActive(false); }
        _inkStory.Continue();
        if (_inkStory.canContinue)
        {
            string line = _inkStory.Continue();
            processTags();
            StartTypewriter(line); //dialogueText.text = _inkStory.Continue();
        }
        else { ExitDialogue();  }
        choicesDisplayed = false;
    }

    public void EnterDialogue(string knot = "start")
    {
        canvas.gameObject.SetActive(true);
        _inkStory.ChoosePathString(knot);
        string line = _inkStory.Continue();
        processTags();
        StartTypewriter(line); //dialogueText.text = _inkStory.Continue();
    }

    private void ExitDialogue() 
    {
        canvas.gameObject.SetActive(false);
        dialogueText.text = "";
        if ((int) _inkStory.variablesState["actions_taken"] >= 10) { DayOver(); }
    }

    private void DayOver() 
    {
        EnterDialogue("day_over");
    }
}