using System.Collections;
using System.Collections.Generic;
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

    Story _inkStory;

    void Awake()
    {
        DontDestroyOnLoad(gameObject);
        _inkStory = new Story(inkAsset.text);
        EnterDialogue();
    }

    private void Update()
    {
        if (_inkStory.canContinue)
        {
            if (Input.GetMouseButtonDown(0))
            {
                dialogueText.text = _inkStory.Continue();
            }
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
        }
        else if (Input.GetMouseButtonDown(0))
        {
            canvas.gameObject.SetActive(false);
            dialogueText.text = "";
        }
    }

    public void makeChoice(int idx) 
    {
        _inkStory.ChooseChoiceIndex(idx);

        for (int i = 0; i < choiceButtons.Length; ++i) { choiceButtons[i].gameObject.SetActive(false);  }

        if (_inkStory.canContinue) { _inkStory.Continue(); } // move past choice repeat
        dialogueText.text = _inkStory.Continue();

        choicesDisplayed = false;
    }

    public void EnterDialogue(string knot = "start") 
    {
        canvas.gameObject.SetActive(true);
        _inkStory.ChoosePathString(knot);
        dialogueText.text = _inkStory.Continue();
    }
}