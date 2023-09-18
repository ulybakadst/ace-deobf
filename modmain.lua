env._G = GLOBAL
AddPrefabPostInitAny(
    function(someImput)
        if someImput.ShardClient and not someImput.components.ace then
            someImput:AddComponent("ace")
        end
    end
)
modimport "scripts/ace_main"
