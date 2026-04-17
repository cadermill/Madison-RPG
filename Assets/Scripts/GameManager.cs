using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance { get; private set; }

    [Header("Game Settings")]
    public float gameDuration = 60f;

    [Header("UI References")]
    public Slider timerBar;
    public Image timerFill;  // Assign: Slider -> Fill Area -> Fill
    public TextMeshProUGUI scoreText;
    public GameObject resultsPanel;
    public TextMeshProUGUI resultsText;

    private float timeRemaining;
    private int score;
    private bool gameActive;

    void Awake()
    {
        if (Instance != null && Instance != this) { Destroy(gameObject); return; }
        Instance = this;
    }

    void Start()
    {
        StartGame();
    }

    public void StartGame()
    {
        timeRemaining = gameDuration;
        score = 0;
        gameActive = true;
        if (resultsPanel) resultsPanel.SetActive(false);
        UpdateScoreUI();

        ClientManager.Instance.PickNewClient();
    }

    void Update()
    {
        if (!gameActive) return;

        timeRemaining -= Time.deltaTime;
        timeRemaining = Mathf.Max(0f, timeRemaining);

        float t = timeRemaining / gameDuration;

        if (timerBar) timerBar.value = t;

        if (timerFill) timerFill.color = Color.Lerp(Color.red, Color.green, t);

        if (timeRemaining <= 0f)
            EndGame();
    }

    public void AddScore()
    {
        score++;
        UpdateScoreUI();
    }

    private void UpdateScoreUI()
    {
        if (scoreText) scoreText.text = $"Orders: {score}";
    }

    private void EndGame()
    {
        gameActive = false;
        if (resultsPanel)
        {
            resultsPanel.SetActive(true);
            if (resultsText)
                resultsText.text = $"Time's up!\nOrders completed: {score}";
        }
    }

    public bool IsGameActive() => gameActive;
}