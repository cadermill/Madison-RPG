using UnityEngine;

public class LeaveArea : MonoBehaviour, IClickableObject
{
    public void OnClick()
    {
        Debug.Log("Object Clicked!");
    }
}
