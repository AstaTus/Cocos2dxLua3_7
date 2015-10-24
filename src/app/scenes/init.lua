SceneSwitcher = import(".SceneSwitcher")
SceneEnum = import(".SceneEnum")

local GameScene = import(".GameScene")
SceneSwitcher:getSingleton():registerScene(SceneEnum.GameScene, GameScene)