function crystal_caves()
    return any(
        can_hm01(),
        adv(can_fly() and (has_climb_level(1) or (has("Super Essence", 1) and has("Essence of Wind", 2))))
    )
end

function forest_of_fall()
    return any(
        is_thicc(),
        adv(true)
    )
end

function maple_sanctuary()
    return any(
        has_climb_level(2),
        adv(has_climb_level(1) and can_fly())
    )
end

function cryptic_caverns()
    return any(
        has_climb_level(1) or can_fly(),
        adv(true)
    )
end

function dark_cave()
    return any(
        is_pitch_black_baby() and has_climb_level(1) and can_fly()),
        adv(has_climb_level(1) and can_sprint() and has("super_spore", 1))
end

function waxcap_falls_cave()
    return any(
        can_go_water(),
        adv(can_fly() or has_climb_level(1))
    )
end

function lake_of_bloom()
    return all (
        forest_of_fall(),
        any(
            can_boom(),
            adv(can_fly()),
            adv(can_hm01()),
            adv(has_climb_level(1)),
            adv(can_sprint() and has("super_spore", 1))
        )
    )
end

function chungy_cave()
    return any (
        can_go_water() and is_pitch_black_baby()
    )
end

function elders_home()
    return all (
        lake_of_bloom(),
        any(
            is_uncle_iroh()
        )
    )
end

function grove_of_life()
    return all (
        elders_home(),
        any(
            can_go_water() and can_fly() and can_screw_glass() and has_climb_level(2),
            adv(can_fly() and can_screw_glass()),
            adv(has_climb_level(2), can_fly(), can_go_water())
        )
    )
end

function tranquil_garden()
    return all (
        elders_home(),
        any(
            can_burn()
        )
    )
end

function glowbug_rescue()
    return all (
        elders_home(),
        any(
            can_fly() and ring_count() >= 1,
            adv(can_fly() and has_climb_level(2))
        )
    )
end
