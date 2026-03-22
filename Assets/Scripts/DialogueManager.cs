using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using UnityEngine.SceneManagement;

public class DialogueManager : MonoBehaviour
{
    public static DialogueManager Instance { get; private set; }

    [SerializeField] private GameObject character;
    [SerializeField] private GameObject textBox;
    [SerializeField] private TextMeshProUGUI dialogueText;
    [SerializeField] private TextAsset inkJSON;

    [Header("Choice Buttons (optional - add if you have them)")]
    [SerializeField] private GameObject choicesPanel;
    [SerializeField] private Button[] choiceButtons;

    private static Story _story;
    private static bool _storyStarted = false;
    private static string _pendingLine = null; // saves line before scene change

    void Awake()
    {
        if (Instance != null && Instance != this)
        {
            // Hand over this scene's UI to the existing manager
            Instance.textBox = textBox;
            Instance.choicesPanel = choicesPanel;
            Instance.choiceButtons = choiceButtons;
            if (character != null) Instance.character = character;

            GameObject foundDialogueTextObj = GameObject.FindWithTag("DialogueText");
            if (foundDialogueTextObj != null)
                Instance.dialogueText = foundDialogueTextObj.GetComponent<TextMeshProUGUI>();
            else
                Instance.dialogueText = dialogueText;

            Debug.Log("[DM] Duplicate destroyed. Handing off to singleton.");
            Destroy(gameObject);
            Instance.StartCoroutine(Instance.ContinueAfterFrame());
            return;
        }

        Instance = this;
        DontDestroyOnLoad(gameObject);

        if (_story == null && inkJSON != null)
            _story = new Story(inkJSON.text);

        HideUI();
    }

    void Start()
    {
        if (!_storyStarted)
        {
            _storyStarted = true;
            Debug.Log("[DM] Starting story for the first time.");
            EnterDialogue("DAY_1_Opening_Dorm_Room");
        }
    }

    private IEnumerator ContinueAfterFrame()
    {
        yield return null;

        // Re-find dialogueText in new scene
        GameObject foundDialogueTextObj = GameObject.FindWithTag("DialogueText");
        if (foundDialogueTextObj != null)
            dialogueText = foundDialogueTextObj.GetComponent<TextMeshProUGUI>();

        // Rewire the TextBox button to this instance
        GameObject foundTextBox = GameObject.FindWithTag("TextBox");
        if (foundTextBox != null)
        {
            textBox = foundTextBox;
            Button textBoxButton = foundTextBox.GetComponent<Button>();
            if (textBoxButton != null)
            {
                textBoxButton.onClick.RemoveAllListeners();
                textBoxButton.onClick.AddListener(() => ContinueDialogue());
            }
        }

        ShowUI();

        if (_pendingLine != null)
        {
            if (dialogueText != null)
                dialogueText.text = _pendingLine;

            _pendingLine = null;

            if (_story.currentChoices.Count > 0)
                DisplayChoices();
        }
        else
        {
            ContinueStory();
        }
    }

    // Called by clickable objects
    public void EnterDialogue(string knotName)
    {
        if (_story == null)
        {
            Debug.LogError("[DM] No Ink story! Make sure inkJSON is assigned.");
            return;
        }

        Debug.Log("[DM] EnterDialogue: " + knotName);
        _story.ChoosePathString(knotName);
        ShowUI();
        ContinueStory();
    }

    // Called by textbox/next button
    public void ContinueDialogue()
    {
        if (_story == null) return;

        Debug.Log("[DM] ContinueDialogue called. canContinue: " + _story.canContinue + " | choices: " + _story.currentChoices.Count);

        if (_story.canContinue)
            ContinueStory();
        else if (_story.currentChoices.Count == 0)
            ExitDialogue();
    }

    // Called by choice buttons
    public void MakeChoice(int choiceIndex)
    {
        Debug.Log("[DM] MakeChoice: " + choiceIndex);
        _story.ChooseChoiceIndex(choiceIndex);

        // Re-find dialogueText in case scene changed
        GameObject foundDialogueTextObj = GameObject.FindWithTag("DialogueText");
        if (foundDialogueTextObj != null)
            dialogueText = foundDialogueTextObj.GetComponent<TextMeshProUGUI>();

        ContinueStory();
    }

    public void LoadScene(string sceneName)
    {
        Debug.Log("[DM] Loading scene: " + sceneName);
        SceneManager.LoadScene(sceneName);
    }

    [ContextMenu("Test EnterDialogue()")]
    void TestEnter() => ShowUI();

    [ContextMenu("Test ExitDialogue()")]
    public void ExitDialogue()
    {
        Debug.Log("[DM] ExitDialogue called.");
        HideUI();
    }

    // ── Helpers ───────────────────────────────────────────────────────────────

    private void ShowUI()
    {
        if (textBox != null) textBox.SetActive(true);
        if (character != null) character.SetActive(true);
    }

    private void HideUI()
    {
        if (textBox != null) textBox.SetActive(false);
        if (character != null) character.SetActive(false);
        if (choicesPanel != null) choicesPanel.SetActive(false);
    }

    public void ContinueStory()
    {
        if (_story == null) return;

        Debug.Log("[DM] ContinueStory. canContinue: " + _story.canContinue + " | choices: " + _story.currentChoices.Count);

        if (choicesPanel != null)
            choicesPanel.SetActive(false);

        if (_story.canContinue)
        {
            string line = _story.Continue().Trim();
            Debug.Log("[DM] Line: " + line);

            // Check tags FIRST — if scene change needed, save line and load scene
            foreach (string tag in _story.currentTags)
            {
                if (tag.StartsWith("scene:"))
                {
                    string sceneName = tag.Split(':')[1].Trim();
                    Debug.Log("[DM] Scene tag found: " + sceneName);
                    _pendingLine = line; // save line to display after scene loads
                    LoadScene(sceneName);
                    return;
                }
            }

            // No scene tag — display normally
            GameObject foundDialogueTextObj = GameObject.FindWithTag("DialogueText");
            if (foundDialogueTextObj != null)
                dialogueText = foundDialogueTextObj.GetComponent<TextMeshProUGUI>();

            if (dialogueText != null)
                dialogueText.text = line;
            else
                Debug.LogError("[DM] dialogueText is null! Tag your TMP text as DialogueText.");

            if (_story.currentChoices.Count > 0)
                DisplayChoices();
        }
        else if (_story.currentChoices.Count > 0)
        {
            Debug.Log("[DM] No more text, showing choices.");
            DisplayChoices();
        }
        else
        {
            ExitDialogue();
        }
    }

    private void DisplayChoices()
    {
        if (choicesPanel == null)
        {
            Debug.LogError("[DM] ChoicesPanel is null!");
            return;
        }
        if (choiceButtons == null || choiceButtons.Length == 0)
        {
            Debug.LogError("[DM] choiceButtons is null or empty!");
            return;
        }

        choicesPanel.SetActive(true);
        List<Choice> choices = _story.currentChoices;
        Debug.Log("[DM] Displaying " + choices.Count + " choices.");

        for (int i = 0; i < choiceButtons.Length; i++)
        {
            if (i < choices.Count)
            {
                choiceButtons[i].gameObject.SetActive(true);
                choiceButtons[i].GetComponentInChildren<TextMeshProUGUI>().text = choices[i].text;

                int index = i;
                choiceButtons[i].onClick.RemoveAllListeners();
                choiceButtons[i].onClick.AddListener(() => MakeChoice(index));
            }
            else
            {
                choiceButtons[i].gameObject.SetActive(false);
            }
        }
    }
}