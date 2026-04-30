using UnityEngine;
using UnityEngine.SceneManagement;

public class Goal : MonoBehaviour
{
    [SerializeField] private AudioClip levelWinSound;
    
    private AudioSource audioSource;
    
    void Start()
    {
        audioSource = gameObject.AddComponent<AudioSource>();
        audioSource.playOnAwake = false;
    }
    
    private void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag("Player"))
        {
            PlayWinSoundAndLoadNext();
        }
    }
    
    private void PlayWinSoundAndLoadNext()
    {
        GameObject soundObject = new GameObject("WinSoundPlayer");
        AudioSource tempAudioSource = soundObject.AddComponent<AudioSource>();
        tempAudioSource.clip = levelWinSound;
        tempAudioSource.Play();
        DontDestroyOnLoad(soundObject);
        Destroy(soundObject, levelWinSound.length);
        
        LoadNextLevel();
    }
    
    private void LoadNextLevel()
    {
        int currentScene = SceneManager.GetActiveScene().buildIndex;
        int nextScene = currentScene + 1;
        
        if (nextScene < SceneManager.sceneCountInBuildSettings)
        {
            if (nextScene == SceneManager.sceneCountInBuildSettings - 1)
            {
                if (GameTimer.Instance != null)
                {
                    GameTimer.Instance.StopTimer();
                }
            }
            
            SceneManager.LoadScene(nextScene);
        }
        else
        {
            if (GameTimer.Instance != null)
            {
                GameTimer.Instance.ResetTimer();
            }
            
            SceneManager.LoadScene(0); 
        }
    }
}