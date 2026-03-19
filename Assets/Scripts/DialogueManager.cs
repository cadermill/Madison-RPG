using System;
using TMPro;
using UnityEngine;

public class DialogueManager : MonoBehaviour
{
    [SerializeField] private GameObject character;
    [SerializeField] private GameObject textBox;

    [ContextMenu("Test EnterDialogue()")]
    void EnterDialogue() 
    {
        textBox.SetActive(true);
        character.gameObject.SetActive(true);
    }

    [ContextMenu("Test ExitDialogue()")]
    void ExitDialogue() 
    {
        textBox.SetActive(false);
        character.gameObject.SetActive(false);
    }
}
