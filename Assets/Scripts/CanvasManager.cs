using UnityEngine;

public class CanvasManager : MonoBehaviour
{
    [SerializeField] private Canvas[] canvases;

    public void changeBackground(string canvasName) 
    {
        for (int i = 0; i < canvases.Length; i++) 
        {
            if (canvases[i].name == "Canvas_" +  canvasName) { canvases[i].gameObject.SetActive(true); break; }
        }
    }
}