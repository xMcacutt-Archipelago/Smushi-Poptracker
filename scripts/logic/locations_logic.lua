function tools_of_the_explorer_found()
    return any(
        can_mine(),
        adv(can_fly() and has_climb_level(1))
    )
end

function tool_of_mining_found()
    return any(
        can_mine() and ((can_fly() and has_climb_level(1)) or has_climb_level(2)),
        adv((can_fly() and has_climb_level(1)) or (can_mine() and (can_fly() or has_climb_level(1))))
    )
end

function super_spore_received()
    return any(
        can_mine() and ((can_fly() and has_climb_level(1)) or has_climb_level(2)),
        adv((can_fly() and has_climb_level(1)) or (can_mine() and (can_fly() or has_climb_level(1))))
    )
end

function pink_shrine_energy_spore()
    return any(
        has_climb_level(1) and can_hm01(),
        adv(can_fly() and can_hm01())
    )
end

function blue_shrine_energy_spore()
    return any(
        has_climb_level(1) or can_fly()
    )
end

function purchase()
    return any(
        can_mine()
    )
end

function anemone_woods_wind_essence()
    return any(
        can_fly()
    )
end

function mycology_journal_unlock()
    return any(
        is_literate()
    )
end

function myrtle_pools_wind_essence()
    return any(
        can_fly(),
        adv(has_climb_level(1) and can_sprint() and has("super_spore", 1))
    )
end

function ancient_relic_2_found()
    return any(
        can_mine() and can_fly() and has_climb_level(1),
        adv(can_fly() and has_climb_level(1)),
        adv(can_fly() and can_mine()),
        adv(has_climb_level(1) and can_mine()),
        adv(has_climb_level(2))
    )
end

function ancient_relic_1_found()
    return any(
        can_mine() and can_fly() and has_climb_level(1),
        adv(can_fly() and (can_mine() or has_climb_level(1))),
        adv(has_climb_level(2) and can_sprint() and has("super_spore", 1))
    )
end

function crystal_cave_blueberry_found()
    return any(
        can_fly() and has_climb_level(1),
        adv(can_fly())
    )
end

function explosive_powder_1_found()
    return any(
        is_member(),
        adv((can_fly() or has_climb_level(1) or can_hm01()) and has("conch_shell", 1))
    )
end

function super_essence_found()
    return any(
        can_fly()
    )
end

function maple_sanctuary_energy_spore()
    return any(
        can_burn()
    )
end

function cryptic_caverns_wind_essence()
    return any(
        can_fly() and has_climb_level(1)
    )
end

function brick_chimney_wind_essence()
    return any(
        can_hm01() and can_fly() and has_climb_level(2),
        adv(has_climb_level(2) and (can_fly() or can_sprint()) and ((can_fly() and has("wind_essence", 2)) or can_hm01()))
    )
end

function restless_stream_energy_spore()
    return any(
        can_hm01() and has_climb_level(1),
        adv(can_hm01() and (can_fly() or has_climb_level(1)))
    )
end

function container_of_light_found()
    return any(
        can_fly() and has_climb_level(2),
        adv(can_fly() and has_climb_level(1))
    )
end

function headlamp_acquired()
    return any(
        can_has_lamp()
    )
end

function dark_cave_energy_spore()
    return any(
        can_burn()
    )
end

function old_string_found()
    return any(
        has_climb_level(2) and can_fly(),
        adv(has_climb_level(1) and can_fly() and can_go_water())
    )
end

function chungy_saved()
    return any(
        can_save_chungus() and can_fly() and has_climb_level(2)
    )
end

function secret_opener_found()
    return any(
        can_burn() and can_hm01() and can_fly() and has_climb_level(2),
        adv(can_burn() and can_hm01() and can_fly() and has_climb_level(1))
    )
end

function screwdriver_purchase()
    return any(
        can_mine() and has_climb_level(1) and can_fly(),
        adv(can_mine() and can_fly()),
        adv(has_climb_level(2) and has("super_spore", 1))
    )
end

function band_aid_found()
    return any(
        can_fly() and has_climb_level(2) and can_hm01(),
        adv(has_climb_level(2) and can_hm01())
    )
end

function ring_count()
    rings = 0
    if has("ring_of_prosperity", 1) then
        rings = rings + 1
    end
    if has("ring_of_youth", 1) then
        rings = rings + 1
    end
    if has("ring_of_truth", 1) then
        rings = rings + 1
    end
    if has("ring_of_spirit", 1) then
        rings = rings + 1
    end
    if has("ring_of_love", 1) then
        rings = rings + 1
    end
    return rings
end

function ring_of_truth_found()
    return any(
        can_hm01() and has_climb_level(2) and can_fly(),
        adv(can_hm01() and has_climb_level(1) and can_fly() and ring_count() >= 1)
    )
end

function ring_of_youth_found()
    return any(
        can_hm01(),
        adv(can_glue() and has("conch_shell", 1))
    )
end

function ring_of_love_found()
    return any(
        can_fly() and has_climb_level(2) and can_screw_glass(),
        adv(can_fly() and has_climb_level(1) and can_screw_glass())
    )
end

function ring_of_spirit_found()
    return any(
        can_burn(),
        adv(can_go_water() and has_climb_level(1) and can_burn())
    )
end

function streamer_1_found()
    return any(
        has_climb_level(2) and can_mine(),
        adv((has_climb_level(1) or (can_fly() and ring_count() >= 1)) and can_mine())
    )
end

function streamer_2_found()
    return any(
        can_hm01() and can_glue(),
        adv(can_hm01())
    )
end

function streamer_3_found()
    return all(
        glowbug_rescue(),
        any(
            can_burn() and has_climb_level(2),
            adv(can_burn() and can_go_water())
        )
    )
end

function streamer_4_found()
    return any(
        ring_count() >= 3,
        adv(ring_count() >= 3 and has_climb_level(1))
    )
end

function macrolepiota_procera()
    return any(
        is_shroom_nerd() and can_fly(),
        adv(has_climb_level(1) and can_sprint() and has("super_spore", 1))
    )
end

function hygrocybe_conica()
    return any(
        has_climb_level(1) and can_fly() and can_mine() and is_shroom_nerd(),
        adv(has_climb_level(1) and can_fly() and is_shroom_nerd())
    )
end

function mycena_chlorophos() 
    return any (
        is_shroom_nerd() and can_fly() and has_climb_level(1) and can_hm01()
    )
end

function psathyrella_aquatica()
    return any(
        is_shroom_nerd() and can_go_water()
    )
end

function heart_of_the_forest()
    return any(
        has("sacred_streamer", 4) and is_shroom_nerd()
    )
end

function purple_augmenter()
    return any(
        has_climb_level(1) and can_hm01()
    )
end

function strawberry_augmenter()
    return any(
        can_fly() and is_stretchy(),
        adv((can_fly() or can_sprint()) and is_stretchy())
    )
end

function flower_augmenter()
    return any(
        has_climb_level(1) and can_hm01()
    )
end

function secret_augmenter()
    return any(
        has_a_secret(),
        adv(can_fly() and has_climb_level(1))
    )
end

function pelagic_augmenter()
    return any(
        can_burn() and can_hm01()
    )
end

function sparkle_augmenter()
    return any(
        has_climb_level(2) and can_fly() and can_sprint(),
        adv(has_climb_level(2) and can_fly())
    )
end

function clavaria_augmenter()
    return any(
        can_go_water() and can_mine()
    )
end

function ink_augmenter()
    return any(
        can_hm01() and can_fly() and has_climb_level(1)
    )
end

function sharp_augmenter()
    return any(
        is_pitch_black_baby() and can_fly() and has_climb_level(2) and can_burn() and can_screw_glass(),
        adv(can_screw_glass() and can_fly() and has_climb_level(2) and is_pitch_black_baby())
    )
end

function precious_augmenter()
    return any(
        ring_count() >= 5,
        adv(has_climb_level(1) and ring_count() >= 5)
    )
end

function rainbow_augmenter()
    return any(
        can_hm01() and has_climb_level(2),
        adv(true)
    )
end

function veiled_augmenter()
    return any(
        can_fly() and has_climb_level(2) and can_hm01(),
        adv(has_climb_level(2) and can_hm01())
    )
end

function sacred_augmenter()
    return any(
        has("sacred_streamer", 4) and has_climb_level(1)
    )
end

function ancient_relics_returned()
    return has("ancient_relic_1", 1) and has("ancient_relic_2", 1)
end