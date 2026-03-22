using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;

public class DialogueManager : MonoBehaviour
{
    [SerializeField] private GameObject character;
    [SerializeField] private GameObject textBox;
    [SerializeField] private TextMeshProUGUI dialogueText;   // drag your TMP text component here
    [SerializeField] private TextAsset inkJSON;              // drag your compiled .json file here

    [Header("Choice Buttons (optional - add if you have them)")]
    [SerializeField] private GameObject choicesPanel;        // a parent object holding your buttons
    [SerializeField] private Button[] choiceButtons;         // your choice buttons

    private Story _story;

    void Start()
    {
        if (inkJSON != null)
            _story = new Story(inkJSON.text);

        // Start hidden
        textBox.SetActive(false);
        character.SetActive(false);

        if (choicesPanel != null)
            choicesPanel.SetActive(false);

        EnterDialogue("DAY_1_Opening_Dorm_Room");
    }

    // ── Called by your clickable objects ──────────────────────────────────────
    // Pass in the knot name from your .ink file e.g. "barista", "desk", "door"
    public void EnterDialogue(string knotName)
    {
        if (_story == null)
        {
            Debug.LogError("No Ink JSON assigned to DialogueManager!");
            return;
        }

        _story.ChoosePathString(knotName);

        textBox.SetActive(true);
        character.SetActive(true);

        ContinueStory();
    }

    // ── Call this to advance text (hook to a "Next" button or panel click)
    public void ContinueDialogue()
    {
        if (_story == null) return;

        if (_story.canContinue)
        {
            ContinueStory();
        }
        else if (_story.currentChoices.Count == 0)
        {
            ExitDialogue();
        }
    }

    // ── Called by choice buttons, pass in 0, 1, 2, 3 ─────────────────────────
    public void MakeChoice(int choiceIndex)
    {
        _story.ChooseChoiceIndex(choiceIndex);
        ContinueStory();
    }

    // ── Keeps your original context menu tests working ────────────────────────
    [ContextMenu("Test EnterDialogue()")]
    void TestEnter()
    {
        textBox.SetActive(true);
        character.SetActive(true);
    }

    [ContextMenu("Test ExitDialogue()")]
    void ExitDialogue()
    {
        textBox.SetActive(false);
        character.SetActive(false);

        if (choicesPanel != null)
            choicesPanel.SetActive(false);
    }

    // ── Internal ──────────────────────────────────────────────────────────────
    private void ContinueStory()
    {
        if (choicesPanel != null)
            choicesPanel.SetActive(false);

        if (_story.canContinue)
        {
            dialogueText.text = _story.Continue().Trim();

            if (_story.currentChoices.Count > 0)
                DisplayChoices();
        }
        else if (_story.currentChoices.Count > 0)
        {
            DisplayChoices();
        }
        else
        {
            ExitDialogue();
        }
    }

    private void DisplayChoices()
    {
        if (choicesPanel == null || choiceButtons == null) return;

        choicesPanel.SetActive(true);
        List<Choice> choices = _story.currentChoices;

        for (int i = 0; i < choiceButtons.Length; i++)
        {
            if (i < choices.Count)
            {
                choiceButtons[i].gameObject.SetActive(true);
                choiceButtons[i].GetComponentInChildren<TextMeshProUGUI>().text = choices[i].text;

                int index = i; // capture for lambda
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