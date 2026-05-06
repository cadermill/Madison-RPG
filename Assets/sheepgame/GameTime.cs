using UnityEngine;
using TMPro; 
using UnityEngine.SceneManagement;

public class GameTimer : MonoBehaviour
{
    public static GameTimer Instance;
    public TextMeshProUGUI timerText;
    private float elapsedTime = 0f;
    private bool isRunning = true;
    
    void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else
        {
            Destroy(gameObject);
        }
    }
    
    void Start()
    {
        SceneManager.sceneLoaded += OnSceneLoaded;
    }
    
    void OnDestroy()
    {
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }
    
    void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        FindTimerText();
    }
    
    void FindTimerText()
    {
        GameObject timerTextObject = GameObject.Find("TimerText");
        
        if (timerTextObject != null)
        {
            timerText = timerTextObject.GetComponent<TextMeshProUGUI>();
        }
        else
        {
            timerText = null;
        }
    }
    
    void Update()
    {
        if (isRunning)
        {
            elapsedTime += Time.deltaTime;
            UpdateTimerDisplay();
        }
    }
    
    void UpdateTimerDisplay()
    {
        if (timerText != null)
        {
            int minutes = Mathf.FloorToInt(elapsedTime / 60f);
            int seconds = Mathf.FloorToInt(elapsedTime % 60f);
            timerText.text = string.Format("{0}:{1:00}", minutes, seconds);
        }
    }
    
    public void StopTimer()
    {
        isRunning = false;
    }
    
    public void ResetTimer()
    {
        elapsedTime = 0f;
        isRunning = true;
    }
    
    public string GetFinalTime()
    {
        int minutes = Mathf.FloorToInt(elapsedTime / 60f);
        int seconds = Mathf.FloorToInt(elapsedTime % 60f);
        return string.Format("{0}:{1:00}", minutes, seconds);
    }
    
    public float GetElapsedTime()
    {
        return elapsedTime;
    }
}