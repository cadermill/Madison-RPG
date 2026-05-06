using UnityEngine;
using TMPro;

public class EndScreen : MonoBehaviour{
    public TextMeshProUGUI finalTimeText; 
    void Start()
    {
        if (GameTimer.Instance != null)
        {
            GameTimer.Instance.StopTimer();
            string finalTime = GameTimer.Instance.GetFinalTime();
            finalTimeText.text = "You took: " + finalTime;
        }
        else
        {
            finalTimeText.text = "You took: N/A";
        }
    }
}