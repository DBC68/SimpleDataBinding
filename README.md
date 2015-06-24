# SimpleDataBinding
This project demonstrates simple iOS data binding using NSNotifications.  

Included is the category <b>NSObject+DataBinding</b> that includes the following methods:




<b>\-(void)registerForDataBindingNotification</b>

Add this method to register for data binding notifications in the class where you want to observe property changes.




<b>\-(void)newValue:(id)value forObject:(id)object</b>

Add this method to the setters of properties you want to observe.
 - value is the new value of the property
 - object should be set to self




<b>\-(void)propertyChanged:(NSNotification *)notification</b>

This method will be fired when a property containing thenewValue:(id)value forObject:(id)object method is changed.
Get the userInfo dictionary in the notification object.  This dictionary contains three key-value pairs:
 - object: a reference to the object containing the property (kDataBindingObjectKey)
 - property: the name of the property (kDataBindingPropertyKey)
 - value: the new value of the property (kDataBindingValueKey)


