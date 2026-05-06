using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CanvasManager : MonoBehaviour
{
    [SerializeField] private Canvas[] canvases;
    [SerializeField] private Image character;
    [SerializeField] private Sprite[] emotions;

    private string currentBackground = "";
    private string currentCharacter  = "";

    public string GetCurrentBackground() => currentBackground;
    public string GetCurrentCharacter()  => currentCharacter;

    public void changeBackground(string canvasName) 
    {
        currentBackground = canvasName;
        hideBackgrounds();
        for (int i = 0; i < canvases.Length; i++) 
        {
            if (canvases[i].name == "Canvas_" + canvasName) { canvases[i].gameObject.SetActive(true); break; }
        }
    }

    public void hideBackgrounds() 
    {
        for (int i = 0; i < canvases.Length; i++) 
        {
            canvases[i].gameObject.SetActive(false);
        }
    }

    public void displayCharacter(string name) 
    {
        currentCharacter = name;
        for (int i = 0; i < emotions.Length; i++)
        {
            if (emotions[i].name == name) { character.sprite = emotions[i]; }
        }
        character.gameObject.SetActive(true);
    }

    public void hideCharacter() { character.gameObject.SetActive(false); }
}