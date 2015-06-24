# SimpleDataBinding
Simple iOS Data Binding via NSNotificationCenter

This project demonstrates simple iOS data binding using NSNotifications.  

Included is the category NSObject+DataBinding that includes the following methods:

\-(void)registerForDataBindingNotification

Add this method to register for data binding notifications in the class
where you want to observe property changes


\-(void)newValue:(id)value forObject:(id)object

Add this method to the setters of properties you want to observe.
 - value is the new value of the property
 - object should be set to self


\-(void)propertyChanged:(NSNotification *)notification

This method will be fired when a property containing thenewValue:(id)value forObject:(id)object method is changed.
Get the userInfo dictionary in the notification object.  This dictionary contains three key-value pairs:
 - object: a reference to the object containing the property (kDataBindingObjectKey)
 - property: the name of the property (kDataBindingPropertyKey)
 - value: the new value of the property (kDataBindingValueKey)


