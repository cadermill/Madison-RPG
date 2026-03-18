using UnityEngine;

public abstract class ClickableObject : MonoBehaviour
{
    public abstract void OnClick();

    protected virtual void OnMouseDown() 
    {
        OnClick();
    }
}
