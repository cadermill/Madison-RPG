using UnityEngine;
using UnityEngine.UI;
using TMPro;
using System.Collections;
using System.Collections.Generic;

public class DoomScrollManager : MonoBehaviour
{
    public static DoomScrollManager Instance { get; private set; }

    [Header("Article GameObjects — regular sprites, NOT in Canvas")]
    public List<NewsArticle> allArticles = new List<NewsArticle>();

    [Header("Canvas UI")]
    public TMP_Text scoreText;
    public Image rightFeedback;
    public Image wrongFeedback;
    public float feedbackDuration = 0.4f;

    [Header("Swipe Settings")]
    public float swipeThreshold = 0.5f;    // in world units
    public float cardReturnSpeed = 10f;
    public float cardSwipeOutSpeed = 12f;  // in world units/sec

    [Header("Exit")]
    public GameObject exitConfirmPanel;

    private int score = 0;
    private NewsArticle currentArticle;
    private Vector3 articleBasePos;
    private List<NewsArticle> pool;

    private Vector3 dragStartWorld;
    private bool isDragging = false;
    private bool isSwiping = false;

    void Awake()
    {
        if (Instance != null && Instance != this) { Destroy(gameObject); return; }
        Instance = this;
    }

    void Start()
    {
        if (rightFeedback) rightFeedback.gameObject.SetActive(false);
        if (wrongFeedback) wrongFeedback.gameObject.SetActive(false);
        if (exitConfirmPanel) exitConfirmPanel.SetActive(false);

        foreach (var a in allArticles)
            a.gameObject.SetActive(false);

        BuildPool();
        ShowNextArticle();
        UpdateScoreUI();
    }

    // ── Pool ───────────────────────────────────────────────────────────────

    void BuildPool()
    {
        pool = new List<NewsArticle>(allArticles);
        Shuffle(pool);
    }

    NewsArticle PickRandom()
    {
        if (pool.Count == 0) BuildPool();
        int idx = Random.Range(0, pool.Count);
        var article = pool[idx];
        pool.RemoveAt(idx);
        return article;
    }

    // ── Display ────────────────────────────────────────────────────────────

    void ShowNextArticle()
    {
        if (currentArticle != null)
            currentArticle.gameObject.SetActive(false);

        currentArticle = PickRandom();
        currentArticle.gameObject.SetActive(true);

        // Reset to original world position
        currentArticle.transform.position = currentArticle.GetComponent<NewsArticle>().originalPosition;
        articleBasePos = currentArticle.transform.position;
    }

    // ── Mouse to world ─────────────────────────────────────────────────────

    Vector3 MouseToWorld()
    {
        Vector3 mp = Input.mousePosition;
        mp.z = Mathf.Abs(Camera.main.transform.position.z);
        return Camera.main.ScreenToWorldPoint(mp);
    }

    // ── Input ──────────────────────────────────────────────────────────────

    void Update()
    {
        if (isSwiping) return;
        if (exitConfirmPanel && exitConfirmPanel.activeSelf) return;

        if (Input.GetMouseButtonDown(0))
        {
            dragStartWorld = MouseToWorld();
            isDragging = true;
        }

        if (Input.GetMouseButton(0) && isDragging)
        {
            float deltaX = MouseToWorld().x - dragStartWorld.x;
            currentArticle.transform.position = new Vector3(
                articleBasePos.x + deltaX,
                articleBasePos.y,
                articleBasePos.z);
        }

        if (Input.GetMouseButtonUp(0) && isDragging)
        {
            isDragging = false;
            float deltaX = MouseToWorld().x - dragStartWorld.x;

            if (deltaX > swipeThreshold)
                StartCoroutine(SwipeOut(true));
            else if (deltaX < -swipeThreshold)
                StartCoroutine(SwipeOut(false));
            else
                StartCoroutine(ReturnCard());
        }
    }

    // ── Swipe ──────────────────────────────────────────────────────────────

    IEnumerator SwipeOut(bool swipedRight)
    {
        isSwiping = true;

        // Fly off 20 world units to the side — enough to leave any screen
        float targetX = articleBasePos.x + (swipedRight ? 20f : -20f);

        while (Mathf.Abs(currentArticle.transform.position.x - targetX) > 0.05f)
        {
            currentArticle.transform.position = Vector3.MoveTowards(
                currentArticle.transform.position,
                new Vector3(targetX, articleBasePos.y, articleBasePos.z),
                cardSwipeOutSpeed * Time.deltaTime
            );
            yield return null;
        }

        bool correct = (swipedRight == currentArticle.isGoodNews);
        if (correct)
        {
            score += 50;
            DoomScrollAudioManager.Instance?.PlayCorrect();
            StartCoroutine(ShowFeedback(true));
        }
        else
        {
            score -= 50;
            DoomScrollAudioManager.Instance?.PlayWrong();
            StartCoroutine(ShowFeedback(false));
        }

        UpdateScoreUI();
        ShowNextArticle();
        isSwiping = false;
    }

    IEnumerator ReturnCard()
    {
        while (Vector3.Distance(currentArticle.transform.position, articleBasePos) > 0.01f)
        {
            currentArticle.transform.position = Vector3.Lerp(
                currentArticle.transform.position,
                articleBasePos,
                Time.deltaTime * cardReturnSpeed);
            yield return null;
        }
        currentArticle.transform.position = articleBasePos;
    }

    // ── Feedback ───────────────────────────────────────────────────────────

    IEnumerator ShowFeedback(bool correct)
    {
        if (correct  && rightFeedback) rightFeedback.gameObject.SetActive(true);
        if (!correct && wrongFeedback) wrongFeedback.gameObject.SetActive(true);
        yield return new WaitForSeconds(feedbackDuration);
        if (rightFeedback) rightFeedback.gameObject.SetActive(false);
        if (wrongFeedback) wrongFeedback.gameObject.SetActive(false);
    }

    // ── Score ──────────────────────────────────────────────────────────────

    void UpdateScoreUI()
    {
        if (scoreText) scoreText.text = $"Score: {score}";
    }

    // ── Exit ───────────────────────────────────────────────────────────────

    public void OnExitButtonPressed()
    {
        if (exitConfirmPanel) exitConfirmPanel.SetActive(true);
    }

    public void OnConfirmExit()
    {
        string target = DoomScrollReturn.previousScene;
        if (!string.IsNullOrEmpty(target))
            UnityEngine.SceneManagement.SceneManager.LoadScene(target);
        else
            UnityEngine.SceneManagement.SceneManager.LoadScene(
                UnityEngine.SceneManagement.SceneManager.GetActiveScene().buildIndex - 1);
    }

    public void OnCancelExit()
    {
        if (exitConfirmPanel) exitConfirmPanel.SetActive(false);
    }

    // ── Util ───────────────────────────────────────────────────────────────

    void Shuffle<T>(List<T> list)
    {
        for (int i = list.Count - 1; i > 0; i--)
        {
            int j = Random.Range(0, i + 1);
            (list[i], list[j]) = (list[j], list[i]);
        }
    }
}

/// Stores the scene name to return to after the doomscroll minigame.
public static class DoomScrollReturn
{
    public static string previousScene = "";
}