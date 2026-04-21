using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance { get; private set; }

    [Header("Game Settings")]
    public float gameDuration = 60f;

    [Header("UI References")]
    public Image timerBar1;        // Assign your first rectangle Image
    public Image timerBar2;        // Assign your second rectangle Image
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
        // Set both images to use Filled image type so we can control fill amount
        if (timerBar1)
        {
            timerBar1.type = Image.Type.Filled;
            timerBar1.fillMethod = Image.FillMethod.Horizontal;
            timerBar1.fillOrigin = (int)Image.OriginHorizontal.Left;
        }
        if (timerBar2)
        {
            timerBar2.type = Image.Type.Filled;
            timerBar2.fillMethod = Image.FillMethod.Horizontal;
            timerBar2.fillOrigin = (int)Image.OriginHorizontal.Left;
        }

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

        float t = timeRemaining / gameDuration; // 1 = full time, 0 = no time

        // Update fill amount and color for both bars
        UpdateTimerBar(timerBar1, t);
        UpdateTimerBar(timerBar2, t);

        if (timeRemaining <= 0f)
            EndGame();
    }

    private void UpdateTimerBar(Image bar, float t)
    {
        if (!bar) return;
        bar.fillAmount = t;                              // Shrinks as time runs out
        bar.color = Color.Lerp(Color.red, Color.green, t); // Green -> Red as time runs out
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