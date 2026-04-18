using UnityEngine;
using UnityEngine.UI;

public class CanvasManager : MonoBehaviour
{
    [SerializeField] private Canvas[] canvases;
    [SerializeField] private Image[] characters;

    public void changeBackground(string canvasName) 
    {
        for (int i = 0; i < canvases.Length; i++) 
        {
            if (canvases[i].name == "Canvas_" +  canvasName) { canvases[i].gameObject.SetActive(true); break; }
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
        for (int i = 0; i < characters.Length; i++) 
        { 
            if (characters[i].name == "Character_" + name) { characters[i].gameObject.SetActive(true); break; }
        }
    }

    public void hideCharacters() 
    {
        for (int i = 0; i < characters.Length; i++) 
        {
            characters[i].gameObject.SetActive(false);
        }
    }
}