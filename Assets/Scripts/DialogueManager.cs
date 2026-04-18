using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using UnityEngine.SceneManagement;

public class DialogueManager : MonoBehaviour
{
    [SerializeField] private TextAsset inkAsset;
    [SerializeField] private Canvas canvas;
    [SerializeField] private TMP_Text dialogueText;
    [SerializeField] private Button[] choiceButtons;

    private bool choicesDisplayed = false;
    private CanvasManager canvasManager;
    Story _inkStory;

    void Awake()
    {
        Debug.Log("AWAKE");
        DontDestroyOnLoad(gameObject);
        _inkStory = new Story(inkAsset.text);
        EnterDialogue();
    }

    // find CanvasManager on each scene load
    void OnEnable() { SceneManager.sceneLoaded += OnSceneLoaded; }

    void OnSceneLoaded(Scene scene, LoadSceneMode mode) { canvasManager = FindFirstObjectByType<CanvasManager>(); }

    void OnDisable() { SceneManager.sceneLoaded -= OnSceneLoaded; }

    private void Update()
    {
        if (Input.GetMouseButtonDown(0)) 
        {
            canvasManager.hideCharacter(); // hide character on next line
            // regular line to display next
            if (_inkStory.canContinue)
            {
                dialogueText.text = _inkStory.Continue();
                processTags();
            }
            // choices to display next
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
            // end of knot
            else 
            {
                canvas.gameObject.SetActive(false); 
                dialogueText.text = "";
            }
        }
    }

    private void processTags()
    {
        for (int i = 0; i < _inkStory.currentTags.Count; ++i)
        {
            string tag = _inkStory.currentTags[i];
            if (tag.Contains("background")) { canvasManager.changeBackground(tag.Split('_')[1]); }
            else if (tag.Contains("character")) { canvasManager.displayCharacter(tag.Split("character_")[1]); }
        }
    }

    public void makeChoice(int idx)
    {
        _inkStory.ChooseChoiceIndex(idx);

        for (int i = 0; i < choiceButtons.Length; ++i) { choiceButtons[i].gameObject.SetActive(false); }

        if (_inkStory.canContinue) { _inkStory.Continue(); } // move past choice repeat
        dialogueText.text = _inkStory.Continue();
        processTags();

        choicesDisplayed = false;
    }

    public void EnterDialogue(string knot = "start")
    {
        canvas.gameObject.SetActive(true);
        _inkStory.ChoosePathString(knot);
        dialogueText.text = _inkStory.Continue();
    }
}