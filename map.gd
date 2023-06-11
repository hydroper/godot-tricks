class_name Map

var _keys = []
var _values = []

var size: int:
    get:
        return len(_keys)

func _init(arg: Variant = null):
    if arg is Array:
        for v in arg:
            assert(v is Array, "Invalid argument given to Map constructor.")
            self._keys.append(v[0])
            self._values.append(v[1])
    elif arg is Map:
        self._keys = arg._keys.slice(0)
        self._values = arg._values.slice(0)
    elif arg != null:
        assert(false, "Invalid argument given to Map constructor.")

func clear() -> void:
    self._keys.clear()
    self._values.clear()

func get_key(key: Variant) -> Variant:
    var i = self._keys.find(key)
    return null if i == -1 else self._values[i]

func set_key(key: Variant, value: Variant) -> Map:
    var i = self._keys.find(key)
    if i == -1:
        self._keys.append(key)
        self._values.append(value)
    else:
        self._values[i] = value
    return self

func delete(key: Variant) -> bool:
    var i = self._keys.find(key)
    if i == -1:
        return false
    self._keys.remove_at(i)
    self._values.remove_at(i)
    return true

func has(key: Variant) -> bool:
    return self._keys.find(key) != -1

func keys() -> Array:
    return self._keys.slice(0)

func values() -> Array:
    return self._keys.slice(0)
