--entity.lua
if data.raw["assembling-machine"]["se-core-miner"] and data.raw["mining-drill"]["se-core-miner-drill"] then

    local shadow =
    {
      filename = "__space-exploration-graphics__/graphics/entity/core-miner/hr/core-miner-shadow.png",
      priority = "high",
      width = 951,
      height = 491,
      frame_count = 1,
      shift = {(2 + 3/32) *3/11, (1 + 22/32) *3/11},
      draw_as_shadow = true,
      scale=0.5 *3/11,
    }
    local shadow_anim = table.deepcopy(shadow)
    shadow_anim.repeat_count = 30
    local off_layer = {
      layers = {
        shadow,
        {
          filename = "__space-exploration-graphics__/graphics/entity/core-miner/hr/core-miner-off.png",
          priority = "high",
          width = 691,
          height = 737,
          frame_count = 1,
          shift = {0, -8/32 *3/11},
          scale=0.5 *3/11,
        },
      }
    }

    data:extend({
      {
        type = "simple-entity-with-force",
        name = "asteroid-miner-placeholder",
        minable = {mining_time = 0.5, result = "asteroid-miner-placeholder"},
        max_health = 300,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        collision_mask = {
          "item-layer",
          "object-layer",
          "player-layer",
          "water-tile"
        },
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        pictures = {
          off_layer,
          off_layer,
          off_layer,
          off_layer
        }
      },
      {
        type = "mining-drill",
        name = "asteroid-miner-drill",
        minable = {mining_time = 0.5, result = "asteroid-miner-placeholder"},
        selection_priority = 10,
        icon = "__space-exploration-graphics__/graphics/icons/core-miner.png",
        icon_size = 32,
        order = "zzz",
        flags = {"placeable-neutral", "placeable-player", "player-creation", "not-blueprintable", "not-deconstructable"},
        max_health = 300,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        resistances = {{type = "fire", percent = 70 }},
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        resource_categories = { "asteroid-mining" },
        resource_searching_radius = 2,
        mining_speed = 1,
        always_draw_idle_animation = false,
        energy_usage = "100kW",
        vector_to_place_result = { 0, -1.85 },
        animations = {
          layers = {
            shadow_anim,
            {
              priority = "high",
              width = 691,
              height = 737,
              frame_count = 30,
              animation_speed = 1,
              shift = {0, -8/32 *3/11},
              scale=0.5 *3/11,
              stripes =
              {
                {
                  filename = "__space-exploration-graphics__/graphics/entity/core-miner/hr/core-miner-1.png",
                  width_in_frames = 2,
                  height_in_frames = 2,
                },
                {
                  filename = "__space-exploration-graphics__/graphics/entity/core-miner/hr/core-miner-2.png",
                  width_in_frames = 2,
                  height_in_frames = 2,
                },
                {
                  filename = "__space-exploration-graphics__/graphics/entity/core-miner/hr/core-miner-3.png",
                  width_in_frames = 2,
                  height_in_frames = 2,
                },
                {
                  filename = "__space-exploration-graphics__/graphics/entity/core-miner/hr/core-miner-4.png",
                  width_in_frames = 2,
                  height_in_frames = 2,
                },
                {
                  filename = "__space-exploration-graphics__/graphics/entity/core-miner/hr/core-miner-5.png",
                  width_in_frames = 2,
                  height_in_frames = 2,
                },
                {
                  filename = "__space-exploration-graphics__/graphics/entity/core-miner/hr/core-miner-6.png",
                  width_in_frames = 2,
                  height_in_frames = 2,
                },
                {
                  filename = "__space-exploration-graphics__/graphics/entity/core-miner/hr/core-miner-7.png",
                  width_in_frames = 2,
                  height_in_frames = 2,
                },
                {
                  filename = "__space-exploration-graphics__/graphics/entity/core-miner/hr/core-miner-8.png",
                  width_in_frames = 2,
                  height_in_frames = 1,
                },
              },
            },
          }
        },
        energy_source =
        {
          type = "electric",
          usage_priority = "secondary-input",
          emissions_per_minute = 10,
        },
        module_specification =
        {
          module_slots = 4
        },
        allowed_effects = {"consumption", "speed", "productivity", "pollution"}
      }
    })
end