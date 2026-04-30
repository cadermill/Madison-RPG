using UnityEngine;
using TMPro;
using UnityEngine.SceneManagement;

public class LevelDisplay : MonoBehaviour
{
    private TextMeshProUGUI levelText;
    
    void Start()
    {
        levelText = GetComponent<TextMeshProUGUI>();
        UpdateLevelDisplay();
    }
    
    void UpdateLevelDisplay()
    {
        string sceneName = SceneManager.GetActiveScene().name;
        levelText.text = sceneName;
    }
}