using UnityEngine;
using TMPro;

public class SpeechBubble : MonoBehaviour
{
    public static SpeechBubble Instance { get; private set; }

    [Header("Assign the Speech TextMeshPro component")]
    public TextMeshProUGUI speechText;

    void Awake()
    {
        if (Instance != null && Instance != this) { Destroy(gameObject); return; }
        Instance = this;
    }

    public void ShowOrder(CoffeeOrder order)
    {
        if (speechText) speechText.text = order.ToString();
    }
}