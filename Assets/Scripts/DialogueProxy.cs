using System.Net;
using UnityEngine;
using UnityEngine.SceneManagement;

public class DialogueProxy : MonoBehaviour
{
    [SerializeField] private string entryKnot;

    private void Start()
    {
        DialogueManager dm = FindFirstObjectByType<DialogueManager>();

        if (entryKnot != "") 
        {
            Debug.Log("ENTER PROXY: " + entryKnot);
            dm.EnterDialogue( entryKnot ); 
        }
    }

    public void EnterDialogueViaProxy(string knot) 
    {
        DialogueManager dm = FindFirstObjectByType<DialogueManager>();
        dm.EnterDialogue(knot);
    }
}
