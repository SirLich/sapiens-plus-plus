# How to add Resources into Sapiens

### evolvingObject.lua

This file is just used to automatically convert different resources into other resources, over time. For example, de-spawning, or drying.

### flora.lua

This file would be used for adding new plants, or trees. Also useful for attaching new resources to existing plants.

### model.lua

This file is required for registering your model (not sure yet.)

### modelPlaceholder.lua

I don't get what this does yet.

### resource.lua

I would consider this the 'main' registration, even if it is one of the simplest ones. Essentially this is the localized name and index of the resource.

### storage.lua

This would be an explanation of how the resource can be stored into a resource zone.

### english.lua

Nothing more than a place to store localized strings.