using UnityEngine;
using UnityEngine.SceneManagement;

public class DialogueProxy : MonoBehaviour
{
    private void Start()
    {
        DialogueManager dm = FindFirstObjectByType<DialogueManager>();
        dm.EnterDialogue(SceneManager.GetActiveScene().name);
    }

    public void EnterDialogueViaProxy(string knot) 
    {
        DialogueManager dm = FindFirstObjectByType<DialogueManager>();
        dm.EnterDialogue(knot);
    }
}
