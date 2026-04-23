using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using System.Collections.Generic;

/// Place in the trivia scene.
/// Hover sound plays automatically when mouse enters any Button.
/// Click sound plays on every mouse click.
/// Correct/Wrong sounds called directly from TriviaManager.
public class TriviaAudioManager : MonoBehaviour
{
    public static TriviaAudioManager Instance { get; private set; }

    [Header("Audio Clips")]
    public AudioClip backgroundMusic;
    public AudioClip hoverClip;
    public AudioClip clickClip;
    public AudioClip correctClip;
    public AudioClip wrongClip;

    [Header("Volume")]
    [Range(0f, 1f)] public float musicVolume = 0.5f;
    [Range(0f, 1f)] public float sfxVolume = 1f;

    private AudioSource musicSource;
    private AudioSource sfxSource;
    private GameObject lastHovered;

    void Awake()
    {
        if (Instance != null && Instance != this) { Destroy(gameObject); return; }
        Instance = this;

        musicSource = gameObject.AddComponent<AudioSource>();
        musicSource.loop = true;
        musicSource.playOnAwake = false;
        musicSource.volume = musicVolume;

        sfxSource = gameObject.AddComponent<AudioSource>();
        sfxSource.loop = false;
        sfxSource.playOnAwake = false;
        sfxSource.volume = sfxVolume;
    }

    void Start()
    {
        if (backgroundMusic)
        {
            musicSource.clip = backgroundMusic;
            musicSource.Play();
        }
    }

    void Update()
    {
        // Click sound on every left click
        if (Input.GetMouseButtonDown(0))
            PlayClick();

        // Hover sound when entering a new Button
        if (EventSystem.current == null) return;

        GameObject hovered = GetHoveredButton();

        if (hovered != null && hovered != lastHovered)
            PlayHover();

        lastHovered = hovered;
    }

    private GameObject GetHoveredButton()
    {
        var pointerData = new PointerEventData(EventSystem.current)
        {
            position = Input.mousePosition
        };

        var results = new List<RaycastResult>();
        EventSystem.current.RaycastAll(pointerData, results);

        foreach (var result in results)
        {
            if (result.gameObject.GetComponentInParent<Button>() != null)
                return result.gameObject;
        }

        return null;
    }

    public void PlayHover()   { if (hoverClip)   sfxSource.PlayOneShot(hoverClip,   sfxVolume); }
    public void PlayClick()   { if (clickClip)   sfxSource.PlayOneShot(clickClip,   sfxVolume); }
    public void PlayCorrect() { if (correctClip) sfxSource.PlayOneShot(correctClip, sfxVolume); }
    public void PlayWrong()   { if (wrongClip)   sfxSource.PlayOneShot(wrongClip,   sfxVolume); }
}