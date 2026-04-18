using UnityEngine;
using UnityEngine.UI;
using TMPro;
using System.Collections.Generic;

public class TriviaManager : MonoBehaviour
{
    [Header("Question Data - swap per subject")]
    public QuestionData questionData;

    [Header("--- GAME UI ---")]
    public TMP_Text questionText;
    public Button[] answerButtons;
    public TMP_Text[] answerButtonLabels;
    public Image timerFillImage;
    public TMP_Text timerText;
    public TMP_Text scoreText;

    [Header("--- RESULT UI ---")]
    public GameObject gamePanel;       // parent object holding all game UI
    public GameObject resultPanel;     // parent object holding result UI
    public TMP_Text resultText;        // the big percentage text

    [Header("Settings")]
    public float timePerQuestion = 15f;

    // private state
    private List<TriviaQuestion> shuffledQuestions;
    private int currentIndex = 0;
    private int score = 0;
    private float timeRemaining;
    private bool answerLocked = false;

    void Start()
    {
        resultPanel.SetActive(false);
        gamePanel.SetActive(true);

        shuffledQuestions = new List<TriviaQuestion>(questionData.questions);
        Shuffle(shuffledQuestions);
        LoadQuestion();
    }

    void Update()
    {
        if (answerLocked) return;

        timeRemaining -= Time.deltaTime;
        float fill = Mathf.Clamp01(timeRemaining / timePerQuestion);
        timerFillImage.fillAmount = fill;
        timerText.text = Mathf.CeilToInt(timeRemaining).ToString();
        timerFillImage.color = Color.Lerp(Color.red, Color.green, fill);

        if (timeRemaining <= 0f)
            OnTimerExpired();
    }

    void LoadQuestion()
    {
        if (currentIndex >= shuffledQuestions.Count)
        {
            ShowResult();
            return;
        }

        answerLocked = false;
        timeRemaining = timePerQuestion;

        var q = shuffledQuestions[currentIndex];
        questionText.text = $"Q{currentIndex + 1} / {shuffledQuestions.Count}\n{q.questionText}";
        UpdateScoreText();

        for (int i = 0; i < answerButtons.Length; i++)
        {
            answerButtonLabels[i].text = q.answers[i];
            answerButtons[i].interactable = true;

            var colors = answerButtons[i].colors;
            colors.normalColor   = Color.white;
            colors.disabledColor = Color.white * 0.85f;
            answerButtons[i].colors = colors;

            int captured = i;
            answerButtons[i].onClick.RemoveAllListeners();
            answerButtons[i].onClick.AddListener(() => OnAnswerSelected(captured));
        }
    }

    public void OnAnswerSelected(int index)
    {
        if (answerLocked) return;
        answerLocked = true;

        var q = shuffledQuestions[currentIndex];
        bool correct = (index == q.correctAnswerIndex);

        if (correct)
        {
            score++;
            HighlightButton(index, Color.green);
        }
        else
        {
            HighlightButton(index, Color.red);
            HighlightButton(q.correctAnswerIndex, Color.green);
        }

        foreach (var btn in answerButtons)
            btn.interactable = false;

        UpdateScoreText();
        Invoke(nameof(NextQuestion), 0.5f);
    }

    void OnTimerExpired()
    {
        if (answerLocked) return;
        answerLocked = true;

        var q = shuffledQuestions[currentIndex];
        HighlightButton(q.correctAnswerIndex, Color.green);
        foreach (var btn in answerButtons)
            btn.interactable = false;

        Invoke(nameof(NextQuestion), 0.5f);
    }

    void NextQuestion()
    {
        currentIndex++;
        LoadQuestion();
    }

    void ShowResult()
    {
        gamePanel.SetActive(false);
        resultPanel.SetActive(true);

        float pct = (float)score / shuffledQuestions.Count * 100f;
        resultText.text = $"{Mathf.RoundToInt(pct)}%\n{score} / {shuffledQuestions.Count}";
    }

    // Call this from your Play Again button
    public void PlayAgain()
    {
        score = 0;
        currentIndex = 0;

        resultPanel.SetActive(false);
        gamePanel.SetActive(true);

        shuffledQuestions = new List<TriviaQuestion>(questionData.questions);
        Shuffle(shuffledQuestions);
        LoadQuestion();
    }

    void HighlightButton(int index, Color color)
    {
        var colors = answerButtons[index].colors;
        colors.normalColor      = color;
        colors.disabledColor    = color * 0.85f;
        colors.highlightedColor = color;
        colors.selectedColor    = color;
        answerButtons[index].colors = colors;
    }

    void UpdateScoreText()
    {
        scoreText.text = $"Score: {score} / {shuffledQuestions.Count}";
    }

    void Shuffle<T>(List<T> list)
    {
        for (int i = list.Count - 1; i > 0; i--)
        {
            int j = Random.Range(0, i + 1);
            (list[i], list[j]) = (list[j], list[i]);
        }
    }
}