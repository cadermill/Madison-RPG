using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

/// Place this in every dialogue scene.
/// - Click sound plays on every mouse click automatically.
/// - Hover sound plays when the mouse enters any UI Button.
/// No manual wiring to individual buttons needed.
public class DialogueAudioManager : MonoBehaviour
{
    public static DialogueAudioManager Instance { get; private set; }

    [Header("Audio Clips")]
    public AudioClip backgroundMusic;
    public AudioClip hoverClip;
    public AudioClip clickClip;

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
        // Global click sound on any mouse click
        if (Input.GetMouseButtonDown(0))
            PlayClick();

        // Hover sound when mouse moves onto a new Button
        if (EventSystem.current == null) return;

        var hovered = EventSystem.current.IsPointerOverGameObject()
            ? GetHoveredButton()
            : null;

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

        var results = new System.Collections.Generic.List<RaycastResult>();
        EventSystem.current.RaycastAll(pointerData, results);

        foreach (var result in results)
        {
            if (result.gameObject.GetComponentInParent<Button>() != null)
                return result.gameObject;
        }

        return null;
    }

    public void PlayHover()
    {
        if (hoverClip) sfxSource.PlayOneShot(hoverClip, sfxVolume);
    }

    public void PlayClick()
    {
        if (clickClip) sfxSource.PlayOneShot(clickClip, sfxVolume);
    }
}