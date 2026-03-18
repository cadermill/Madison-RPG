using System;
using TMPro;
using UnityEngine;

public class SceneManager : MonoBehaviour
{
    [SerializeField] private Character[] characters;
    [SerializeField] private GameObject textBox;
    [SerializeField] private ClickableObject[] clickObjects;

    [ContextMenu("Test EnterDialogue()")]
    void EnterDialogue() 
    {
        textBox.SetActive(true);
        if (characters.Length == 1)
        {
            characters[0].gameObject.SetActive(true);
        }
        else { Debug.Log("Too many characters! (Not implemented yet)"); }
    }

    [ContextMenu("Test ExitDialogue()")]
    void ExitDialogue() 
    {
        textBox.SetActive(false);
        characters[0].gameObject.SetActive(false);
    }
}
