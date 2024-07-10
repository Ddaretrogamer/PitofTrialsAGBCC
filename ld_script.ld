ENTRY(Start)

gNumMusicPlayers = 4;
gMaxLines = 0;
gInitialMainCB2 = CB2_InitCopyrightScreenAfterBootup;

MEMORY
{
    EWRAM (rwx) : ORIGIN = 0x2000000, LENGTH = 256K
    IWRAM (rwx) : ORIGIN = 0x3000000, LENGTH = 32K
    ROM    (rx) : ORIGIN = 0x8000000, LENGTH = 32M
}

SECTIONS {

    .ewram ORIGIN(EWRAM) : AT (__ewram_lma)
    ALIGN(4)
    {
        __ewram_start = .;
        *(.ewram*)
        __ewram_end = .;
    } > EWRAM

    .ewram.sbss (NOLOAD) :
    ALIGN(4)
    {
        INCLUDE "sym_ewram.ld"
        src/*.o(.sbss);
        gflib/*.o(.sbss);

        *libc.a:impure.o(.data);
        *libc.a:locale.o(.data);
        *libc.a:mallocr.o(.data);
    } > EWRAM

    .iwram ORIGIN(IWRAM) : AT (__iwram_lma)
    ALIGN(4)
    {
        __iwram_start = .;
        *(.iwram*);
        __iwram_end = .;
    } > IWRAM

    .iwram.bss (NOLOAD) :
    ALIGN(4)
    {
        /* .bss starts at 0x3000000 */
        INCLUDE "sym_bss.ld"
        src/*.o(.bss);
        gflib/*.o(.bss);
        data/*.o(.bss);

        /* .bss.code starts at 0x3001AA8 */
        src/m4a.o(.bss.code);

        /* COMMON starts at 0x30022A8 */
        INCLUDE "sym_common.ld"
        *libc.a:sbrkr.o(COMMON);
    } > IWRAM

    /* BEGIN ROM DATA */
    . = 0x8000000;

    .text :
    ALIGN(4)
    {
        src/rom_header.o(.text);
        src/rom_header_gf.o(.text.*);
        src/rom_header_rhh.o(.text.*);
        src/crt0.o(.text);
        src/main.o(.text);
        gflib/malloc.o(.text);
        gflib/dma3_manager.o(.text);
        gflib/gpu_regs.o(.text);
        gflib/bg.o(.text);
        gflib/blit.o(.text);
        gflib/window.o(.text);
        gflib/text.o(.text);
        gflib/sprite.o(.text);
        gflib/string_util.o(.text);
        src/link.o(.text);
        src/AgbRfu_LinkManager.o(.text);
        src/link_rfu_3.o(.text);
        src/link_rfu_2.o(.text);
        src/union_room.o(.text);
        src/mystery_gift_menu.o(.text);
        src/union_room_player_avatar.o(.text);
        src/wireless_communication_status_screen.o(.text);
        src/union_room_battle.o(.text);
        src/mystery_gift.o(.text);
        src/mystery_gift_view.o(.text);
        src/mystery_gift_server.o(.text);
        src/mystery_gift_client.o(.text);
        src/mystery_gift_link.o(.text);
        src/wonder_news.o(.text);
        src/union_room_chat.o(.text);
        src/berry_crush.o(.text);
        src/berry_powder.o(.text);
        src/dodrio_berry_picking.o(.text);
        src/pokemon_jump.o(.text);
        src/minigame_countdown.o(.text);
        src/rtc.o(.text);
        src/main_menu.o(.text);
        src/battle_controllers.o(.text);
        src/decompress.o(.text);
        src/digit_obj_util.o(.text);
        src/battle_bg.o(.text);
        src/battle_main.o(.text);
        src/battle_util.o(.text);
        src/battle_z_move.o(.text);
        src/battle_script_commands.o(.text);
        src/battle_util2.o(.text);
        src/battle_controller_player.o(.text);
        src/battle_gfx_sfx_util.o(.text);
        src/battle_controller_opponent.o(.text);
        src/battle_ai_switch_items.o(.text);
        src/battle_controller_link_opponent.o(.text);
        src/battle_debug.o(.text);
        src/pokemon.o(.text);
        src/trig.o(.text);
        src/random.o(.text);
        src/util.o(.text);
        src/daycare.o(.text);
        src/egg_hatch.o(.text);
        src/battle_interface.o(.text);
        src/battle_anim_smokescreen.o(.text);
        src/pokeball.o(.text);
        src/load_save.o(.text);
        src/trade.o(.text);
        src/berry_blender.o(.text);
        src/play_time.o(.text);
        src/new_game.o(.text);
        src/overworld.o(.text);
        src/fieldmap.o(.text);
        src/metatile_behavior.o(.text);
        src/field_camera.o(.text);
        src/field_door.o(.text);
        src/field_player_avatar.o(.text);
        src/event_object_movement.o(.text);
        src/follower_helper.o(.text);
        src/field_message_box.o(.text);
        src/event_object_lock.o(.text);
        src/text_window.o(.text);
        src/script.o(.text);
        src/scrcmd.o(.text);
        src/field_control_avatar.o(.text);
        src/event_data.o(.text);
        src/coord_event_weather.o(.text);
        src/field_tasks.o(.text);
        src/clock.o(.text);
        src/reset_rtc_screen.o(.text);
        src/start_menu.o(.text);
        src/tileset_anims.o(.text);
        src/palette.o(.text);
        src/sound.o(.text);
        src/battle_anim.o(.text);
        src/battle_anim_mons.o(.text);
        src/task.o(.text);
        src/reshow_battle_screen.o(.text);
        src/battle_anim_status_effects.o(.text);
        src/title_screen.o(.text);
        src/field_weather.o(.text);
        src/field_weather_effect.o(.text);
        src/field_screen_effect.o(.text);
        src/battle_setup.o(.text);
        src/cable_club.o(.text);
        src/trainer_see.o(.text);
        src/wild_encounter.o(.text);
        src/field_effect.o(.text);
        src/scanline_effect.o(.text);
        src/option_menu.o(.text);
        src/pokedex.o(.text);
        src/trainer_card.o(.text);
        src/frontier_pass.o(.text);
        src/pokemon_storage_system.o(.text);
        src/pokemon_icon.o(.text);
        src/script_movement.o(.text);
        src/fldeff_cut.o(.text);
        src/mail_data.o(.text);
        src/map_name_popup.o(.text);
        src/item_menu_icons.o(.text);
        src/battle_anim_mon_movement.o(.text);
        src/item.o(.text);
        src/contest.o(.text);
        src/shop.o(.text);
        src/fldeff_escalator.o(.text);
        src/berry.o(.text);
        src/script_menu.o(.text);
        src/naming_screen.o(.text);
        src/money.o(.text);
        src/contest_effect.o(.text);
        src/record_mixing.o(.text);
        src/secret_base.o(.text);
        src/tv.o(.text);
        src/contest_util.o(.text);
        src/script_pokemon_util.o(.text);
        src/field_poison.o(.text);
        src/pokemon_size_record.o(.text);
        src/fldeff_misc.o(.text);
        src/field_special_scene.o(.text);
        src/rotating_gate.o(.text);
        src/safari_zone.o(.text);
        src/contest_link.o(.text);
        src/item_use.o(.text);
        src/battle_anim_effects_1.o(.text);
        src/battle_anim_effects_2.o(.text);
        src/battle_anim_water.o(.text);
        src/battle_anim_fire.o(.text);
        src/battle_anim_electric.o(.text);
        src/battle_anim_ice.o(.text);
        src/battle_anim_fight.o(.text);
        src/battle_anim_poison.o(.text);
        src/battle_anim_flying.o(.text);
        src/battle_anim_psychic.o(.text);
        src/battle_anim_bug.o(.text);
        src/battle_anim_rock.o(.text);
        src/battle_anim_ghost.o(.text);
        src/battle_anim_dragon.o(.text);
        src/battle_anim_dark.o(.text);
        src/battle_anim_ground.o(.text);
        src/battle_anim_normal.o(.text);
        src/battle_anim_utility_funcs.o(.text);
        src/battle_anim_new.o(.text);
        src/battle_intro.o(.text);
        src/bike.o(.text);
        src/easy_chat.o(.text);
        src/mon_markings.o(.text);
        src/mauville_old_man.o(.text);
        src/mail.o(.text);
        src/menu_helpers.o(.text);
        src/dewford_trend.o(.text);
        src/heal_location.o(.text);
        src/region_map.o(.text);
        src/image_processing_effects.o(.text);
        src/decoration.o(.text);
        src/slot_machine.o(.text);
        src/contest_painting.o(.text);
        src/battle_ai_main.o(.text);
		src/battle_ai_util.o(.text);
        src/trader.o(.text);
        src/starter_choose.o(.text);
        src/wallclock.o(.text);
        src/fldeff_rocksmash.o(.text);
        src/fldeff_dig.o(.text);
        src/pokeblock.o(.text);
        src/fldeff_flash.o(.text);
        src/post_battle_event_funcs.o(.text);
        src/time_events.o(.text);
        src/birch_pc.o(.text);
        src/hof_pc.o(.text);
        src/field_specials.o(.text);
        src/battle_records.o(.text);
        src/pokedex_area_screen.o(.text);
        src/evolution_scene.o(.text);
        src/roulette.o(.text);
        src/pokedex_cry_screen.o(.text);
        src/coins.o(.text);
        src/landmark.o(.text);
        src/fldeff_strength.o(.text);
        src/battle_transition.o(.text);
        src/battle_controller_link_partner.o(.text);
        src/battle_message.o(.text);
        src/cable_car.o(.text);
        src/math_util.o(.text);
        src/palette_util.o(.text);
        src/confetti_util.o(.text);
        src/save.o(.text);
        src/mystery_event_script.o(.text);
        src/field_effect_helpers.o(.text);
        src/contest_ai.o(.text);
        src/battle_anim_sound_tasks.o(.text);
        src/battle_controller_safari.o(.text);
        src/fldeff_sweetscent.o(.text);
        src/battle_anim_effects_3.o(.text);
        src/move_relearner.o(.text);
        src/fldeff_softboiled.o(.text);
        src/decoration_inventory.o(.text);
        src/roamer.o(.text);
        src/battle_tower.o(.text);
        src/use_pokeblock.o(.text);
        src/battle_controller_wally.o(.text);
        src/player_pc.o(.text);
        src/intro.o(.text);
        src/reload_save.o(.text);
        src/field_region_map.o(.text);
        src/battle_anim_throw.o(.text);
        src/hall_of_fame.o(.text);
        src/credits.o(.text);
        src/lottery_corner.o(.text);
        src/diploma.o(.text);
        src/berry_tag_screen.o(.text);
        src/mystery_event_menu.o(.text);
        src/save_failed_screen.o(.text);
        src/braille_puzzles.o(.text);
        src/pokeblock_feed.o(.text);
        src/clear_save_data_screen.o(.text);
        src/intro_credits_graphics.o(.text);
        src/evolution_graphics.o(.text);
        src/bard_music.o(.text);
        src/fldeff_teleport.o(.text);
        src/battle_tv.o(.text);
        src/pokemon_animation.o(.text);
        src/recorded_battle.o(.text);
        src/battle_controller_recorded_opponent.o(.text);
        src/battle_controller_recorded_player.o(.text);
        src/trainer_pokemon_sprites.o(.text);
        src/lilycove_lady.o(.text);
        src/battle_dome.o(.text);
        src/battle_palace.o(.text);
        src/match_call.o(.text);
        src/menu.o(.text);
        src/battle_factory_screen.o(.text);
        src/apprentice.o(.text);
        src/frontier_util.o(.text);
        src/battle_arena.o(.text);
        src/battle_factory.o(.text);
        src/battle_pike.o(.text);
        src/rotating_tile_puzzle.o(.text);
        src/battle_pyramid.o(.text);
        src/item_menu.o(.text);
        src/list_menu.o(.text);
        src/dynamic_placeholder_text_util.o(.text);
        src/save_location.o(.text);
        src/item_icon.o(.text);
        src/party_menu.o(.text);
        src/battle_tent.o(.text);
        src/braille.o(.text);
        src/multiboot.o(.text);
        src/berry_fix_graphics.o(.text);
        src/battle_controller_player_partner.o(.text);
        src/mirage_tower.o(.text);
        src/berry_fix_program.o(.text);
        src/pokemon_summary_screen.o(.text);
        src/pokedex_area_region_map.o(.text);
        src/battle_pyramid_bag.o(.text);
        src/pokenav.o(.text);
        src/pokenav_main_menu.o(.text);
        src/pokenav_list.o(.text);
        src/pokenav_menu_handler.o(.text);
        src/pokenav_menu_handler_gfx.o(.text);
        src/pokenav_match_call_list.o(.text);
        src/pokenav_match_call_gfx.o(.text);
        src/pokenav_region_map.o(.text);
        src/pokenav_conditions.o(.text);
        src/pokenav_conditions_gfx.o(.text);
        src/pokenav_conditions_search_results.o(.text);
        src/pokenav_ribbons_list.o(.text);
        src/pokenav_ribbons_summary.o(.text);
        src/pokenav_match_call_data.o(.text);
        src/menu_specialized.o(.text);
        src/ereader_helpers.o(.text);
        src/faraway_island.o(.text);
        src/ereader_screen.o(.text);
        src/trainer_hill.o(.text);
        src/rayquaza_scene.o(.text);
        src/walda_phrase.o(.text);
        src/contest_link_util.o(.text);
        src/gym_leader_rematch.o(.text);
        src/battle_transition_frontier.o(.text);
        src/international_string_util.o(.text);
        src/pokemon_debug.o(.text);
        src/expansion_intro.o(.text);
    } > ROM =0

    script_data :
    ALIGN(4)
    {
        data/event_scripts.o(script_data);
        data/battle_anim_scripts.o(script_data);
        data/battle_scripts_1.o(script_data);
        data/field_effect_scripts.o(script_data);
        data/battle_scripts_2.o(script_data);
        data/contest_ai_scripts.o(script_data);
        data/mystery_event_script_cmd_table.o(script_data);
    } > ROM =0

    lib_text :
    ALIGN(4)
    {
        src/libgcnmultiboot.o(.text);
        src/m4a_1.o(.text);
        src/m4a.o(.text);
        src/agb_flash.o(.text);
        src/agb_flash_1m.o(.text);
        src/agb_flash_mx.o(.text);
        src/siirtc.o(.text);
        src/librfu_stwi.o(.text);
        src/librfu_intr.o(.text);
        src/librfu_rfu.o(.text);
        src/librfu_sio32id.o(.text);
        src/libisagbprn.o(.text);
        *libagbsyscall.a:ArcTan2.o(.text);
        *libagbsyscall.a:BgAffineSet.o(.text);
        *libagbsyscall.a:CpuFastSet.o(.text);
        *libagbsyscall.a:CpuSet.o(.text);
        *libagbsyscall.a:Div.o(.text);
        *libagbsyscall.a:LZ77UnCompVram.o(.text);
        *libagbsyscall.a:LZ77UnCompWram.o(.text);
        *libagbsyscall.a:MultiBoot.o(.text);
        *libagbsyscall.a:ObjAffineSet.o(.text);
        *libagbsyscall.a:RLUnCompVram.o(.text);
        *libagbsyscall.a:RLUnCompWram.o(.text);
        *libagbsyscall.a:RegisterRamReset.o(.text);
        *libagbsyscall.a:SoftReset.o(.text);
        *libagbsyscall.a:Sqrt.o(.text);
        *libagbsyscall.a:VBlankIntrWait.o(.text);
        *libgcc.a:_call_via_rX.o(.text);
        *libgcc.a:_divdi3.o(.text);
        *libgcc.a:_divsi3.o(.text);
        *libgcc.a:_dvmd_tls.o(.text);
        *libgcc.a:_fixunsdfsi.o(.text);
        *libgcc.a:_fixunssfsi.o(.text);
        *libgcc.a:_modsi3.o(.text);
        *libgcc.a:_muldi3.o(.text);
        *libgcc.a:_udivdi3.o(.text);
        *libgcc.a:_udivsi3.o(.text);
        *libgcc.a:_umodsi3.o(.text);
        *libgcc.a:dp-bit.o(.text);
        *libgcc.a:fp-bit.o(.text);
        *libgcc.a:_lshrdi3.o(.text);
        *libgcc.a:_negdi2.o(.text);
        *libc.a:memcpy.o(.text);
        *libc.a:memset.o(.text);
        *libc.a:strcmp.o(.text);
        *libc.a:strcpy.o(.text);
        *libc.a:impure.o(.text);
        *libc.a:vsprintf.o(.text);
        *libc.a:vfprintf.o(.text);
        *libc.a:wsetup.o(.text);
        *libc.a:dtoa.o(.text);
        *libc.a:fflush.o(.text);
        *libc.a:findfp.o(.text);
        *libc.a:freer.o(.text);
        *libc.a:mtrim.o(.text);
        *libc.a:fvwrite.o(.text);
        *libc.a:fwalk.o(.text);
        *libc.a:locale.o(.text);
        *libc.a:makebuf.o(.text);
        *libc.a:mallocr.o(.text);
        *libc.a:mbtowc_r.o(.text);
        *libc.a:memchr.o(.text);
        *libc.a:memmove.o(.text);
        *libc.a:mlock.o(.text);
        *libc.a:mprec.o(.text);
        *libc.a:s_isinf.o(.text);
        *libc.a:s_isnan.o(.text);
        *libc.a:sbrkr.o(.text);
        *libc.a:stdio.o(.text);
        *libc.a:strlen.o(.text);
        *libc.a:syscalls.o(.text);
        *libc.a:writer.o(.text);
        *libc.a:callocr.o(.text);
        *libc.a:closer.o(.text);
        *libc.a:errno.o(.text);
        *libc.a:fstatr.o(.text);
        *libc.a:libcfunc.o(.text);
        *libc.a:lseekr.o(.text);
        *libc.a:readr.o(.text);
    } > ROM =0

    .rodata :
    ALIGN(4)
    {
        src/rom_header.o(.rodata);
        src/rom_header_gf.o(.rodata);
        src/main.o(.rodata);
        gflib/bg.o(.rodata);
        gflib/window.o(.rodata);
        gflib/text.o(.rodata);
        gflib/sprite.o(.rodata);
        gflib/io_reg.o(.rodata);
        gflib/string_util.o(.rodata);
        src/link.o(.rodata);
        src/link.o(.rodata.str1.4);
        src/AgbRfu_LinkManager.o(.rodata);
        src/link_rfu_3.o(.rodata);
        src/link_rfu_2.o(.rodata);
        src/link_rfu_2.o(.rodata.str1.4);
        src/union_room.o(.rodata);
        src/mystery_gift_menu.o(.rodata);
        src/union_room_player_avatar.o(.rodata);
        src/wireless_communication_status_screen.o(.rodata);
        src/union_room_battle.o(.rodata);
        src/mystery_gift.o(.rodata);
        src/mystery_gift_view.o(.rodata);
        src/mystery_gift_server.o(.rodata);
        src/mystery_gift_client.o(.rodata);
        src/mystery_gift_scripts.o(.rodata);
        src/wonder_news.o(.rodata);
        src/union_room_chat.o(.rodata);
        src/berry_crush.o(.rodata);
        src/berry_powder.o(.rodata);
        src/dodrio_berry_picking.o(.rodata);
        src/pokemon_jump.o(.rodata);
        src/minigame_countdown.o(.rodata);
        src/rtc.o(.rodata);
        src/main_menu.o(.rodata);
        src/battle_controllers.o(.rodata);
        src/digit_obj_util.o(.rodata);
        src/data.o(.rodata);
        src/battle_bg.o(.rodata);
        src/battle_main.o(.rodata);
        src/battle_util.o(.rodata);
        src/battle_z_move.o(.rodata);
        src/battle_script_commands.o(.rodata);
        src/battle_controller_player.o(.rodata);
        src/battle_anim_smokescreen.o(.rodata);
        src/battle_controller_opponent.o(.rodata);
        src/battle_ai_switch_items.o(.rodata);
        src/battle_controller_link_opponent.o(.rodata);
        src/battle_debug.o(.rodata);
        src/pokemon.o(.rodata);
        src/trig.o(.rodata);
        src/util.o(.rodata);
        src/daycare.o(.rodata);
        src/egg_hatch.o(.rodata);
        src/battle_gfx_sfx_util.o(.rodata);
        src/battle_interface.o(.rodata);
        src/pokeball.o(.rodata);
        src/trade.o(.rodata);
        src/berry_blender.o(.rodata);
        src/new_game.o(.rodata);
        src/overworld.o(.rodata);
        src/tilesets.o(.rodata);
        data/maps.o(.rodata);
        src/fieldmap.o(.rodata);
        src/metatile_behavior.o(.rodata);
        src/field_door.o(.rodata);
        src/field_player_avatar.o(.rodata);
        src/event_object_movement.o(.rodata);
        src/follower_helper.o(.rodata);
        src/text_window.o(.rodata);
        src/scrcmd.o(.rodata);
        src/field_control_avatar.o(.rodata);
        src/coord_event_weather.o(.rodata);
        src/field_tasks.o(.rodata);
        src/reset_rtc_screen.o(.rodata);
        src/start_menu.o(.rodata);
        src/tileset_anims.o(.rodata);
        src/palette.o(.rodata);
        src/sound.o(.rodata);
        src/battle_anim.o(.rodata);
        src/battle_anim_mons.o(.rodata);
        data/map_events.o(.rodata);
        src/reshow_battle_screen.o(.rodata);
        src/battle_anim_status_effects.o(.rodata);
        src/title_screen.o(.rodata);
        src/field_weather.o(.rodata);
        src/field_weather_effect.o(.rodata);
        src/field_screen_effect.o(.rodata);
        src/battle_setup.o(.rodata);
        src/cable_club.o(.rodata);
        src/trainer_see.o(.rodata);
        src/wild_encounter.o(.rodata);
        src/field_effect.o(.rodata);
        src/scanline_effect.o(.rodata);
        src/option_menu.o(.rodata);
        src/pokedex.o(.rodata);
        src/trainer_card.o(.rodata);
        src/frontier_pass.o(.rodata);
        src/pokemon_storage_system.o(.rodata);
        src/pokemon_icon.o(.rodata);
        src/fldeff_cut.o(.rodata);
        src/map_name_popup.o(.rodata);
        src/item_menu_icons.o(.rodata);
        src/battle_anim_mon_movement.o(.rodata);
        src/item.o(.rodata);
        src/contest.o(.rodata);
        src/shop.o(.rodata);
        src/fldeff_escalator.o(.rodata);
        src/berry.o(.rodata);
        src/script_menu.o(.rodata);
        src/naming_screen.o(.rodata);
        src/money.o(.rodata);
        src/contest_effect.o(.rodata);
        src/record_mixing.o(.rodata);
        src/secret_base.o(.rodata);
        src/tv.o(.rodata);
        src/contest_util.o(.rodata);
        src/script_pokemon_util.o(.rodata);
        src/pokemon_size_record.o(.rodata)
        src/fldeff_misc.o(.rodata);
        src/field_special_scene.o(.rodata);
        src/rotating_gate.o(.rodata);
        src/contest_link.o(.rodata);
        src/item_use.o(.rodata);
        src/battle_anim_effects_1.o(.rodata);
        src/battle_anim_effects_2.o(.rodata);
        src/battle_anim_water.o(.rodata);
        src/battle_anim_fire.o(.rodata);
        src/battle_anim_electric.o(.rodata);
        src/battle_anim_ice.o(.rodata);
        src/battle_anim_fight.o(.rodata);
        src/battle_anim_poison.o(.rodata);
        src/battle_anim_flying.o(.rodata);
        src/battle_anim_psychic.o(.rodata);
        src/battle_anim_bug.o(.rodata);
        src/battle_anim_rock.o(.rodata);
        src/battle_anim_ghost.o(.rodata);
        src/battle_anim_dragon.o(.rodata);
        src/battle_anim_dark.o(.rodata);
        src/battle_anim_ground.o(.rodata);
        src/battle_anim_normal.o(.rodata);
        src/battle_anim_utility_funcs.o(.rodata);
        src/battle_anim_new.o(.rodata);
        src/battle_intro.o(.rodata);
        src/bike.o(.rodata);
        src/easy_chat.o(.rodata);
        src/mon_markings.o(.rodata);
        src/mauville_old_man.o(.rodata);
        src/mail.o(.rodata);
        src/menu_helpers.o(.rodata);
        src/heal_location.o(.rodata);
        src/region_map.o(.rodata);
        src/image_processing_effects.o(.rodata);
        src/decoration.o(.rodata);
        src/slot_machine.o(.rodata);
        src/contest_painting.o(.rodata);
        src/battle_ai_main.o(.rodata);
		src/battle_ai_util.o(.rodata);
        src/trader.o(.rodata);
        src/starter_choose.o(.rodata);
        src/wallclock.o(.rodata);
        src/pokeblock.o(.rodata);
        src/fldeff_flash.o(.rodata);
        src/time_events.o(.rodata);
        src/field_specials.o(.rodata);
        src/battle_records.o(.rodata);
        src/pokedex_area_screen.o(.rodata);
        src/evolution_scene.o(.rodata);
        src/roulette.o(.rodata);
        src/pokedex_cry_screen.o(.rodata);
        src/landmark.o(.rodata);
        src/battle_transition.o(.rodata);
        src/battle_controller_link_partner.o(.rodata);
        src/battle_message.o(.rodata);
        src/cable_car.o(.rodata);
        src/save.o(.rodata);
        src/field_effect_helpers.o(.rodata);
        src/contest_ai.o(.rodata);
        src/battle_anim_sound_tasks.o(.rodata);
        src/battle_controller_safari.o(.rodata);
        src/battle_anim_effects_3.o(.rodata);
        src/move_relearner.o(.rodata);
        src/roamer.o(.rodata);
        src/battle_tower.o(.rodata);
        src/use_pokeblock.o(.rodata);
        src/battle_controller_wally.o(.rodata);
        src/player_pc.o(.rodata);
        src/intro.o(.rodata);
        src/field_region_map.o(.rodata);
        src/battle_anim_throw.o(.rodata);
        src/hall_of_fame.o(.rodata);
        src/credits.o(.rodata);
        src/lottery_corner.o(.rodata);
        src/diploma.o(.rodata);
        src/strings.o(.rodata);
        src/berry_tag_screen.o(.rodata);
        src/mystery_event_menu.o(.rodata);
        src/save_failed_screen.o(.rodata);
        src/braille_puzzles.o(.rodata);
        src/pokeblock_feed.o(.rodata);
        src/clear_save_data_screen.o(.rodata);
        src/intro_credits_graphics.o(.rodata);
        src/evolution_graphics.o(.rodata);
        src/bard_music.o(.rodata);
        src/battle_tv.o(.rodata);
        src/pokemon_animation.o(.rodata);
        src/battle_controller_recorded_opponent.o(.rodata);
        src/battle_controller_recorded_player.o(.rodata);
        src/trainer_pokemon_sprites.o(.rodata);
        src/lilycove_lady.o(.rodata);
        src/battle_dome.o(.rodata);
        src/battle_palace.o(.rodata);
        src/match_call.o(.rodata);
        src/menu.o(.rodata);
        src/battle_factory_screen.o(.rodata);
        src/apprentice.o(.rodata);
        src/frontier_util.o(.rodata);
        src/battle_arena.o(.rodata);
        src/battle_factory.o(.rodata);
        src/battle_pike.o(.rodata);
        src/rotating_tile_puzzle.o(.rodata);
        src/battle_pyramid.o(.rodata);
        src/item_menu.o(.rodata);
        src/list_menu.o(.rodata);
        src/save_location.o(.rodata);
        src/item_icon.o(.rodata);
        src/party_menu.o(.rodata);
        src/battle_tent.o(.rodata);
        src/braille.o(.rodata);
        src/multiboot.o(.rodata);
        src/berry_fix_graphics.o(.rodata);
        src/battle_controller_player_partner.o(.rodata);
        src/mirage_tower.o(.rodata);
        src/berry_fix_program.o(.rodata);
        src/pokemon_summary_screen.o(.rodata);
        src/pokedex_area_region_map.o(.rodata);
        src/battle_pyramid_bag.o(.rodata);
        src/pokenav.o(.rodata);
        src/pokenav_main_menu.o(.rodata);
        src/pokenav_list.o(.rodata);
        src/pokenav_menu_handler.o(.rodata);
        src/pokenav_menu_handler_gfx.o(.rodata);
        src/pokenav_match_call_list.o(.rodata);
        src/pokenav_match_call_gfx.o(.rodata);
        src/pokenav_region_map.o(.rodata);
        src/pokenav_conditions_gfx.o(.rodata);
        src/pokenav_conditions_search_results.o(.rodata);
        src/pokenav_ribbons_list.o(.rodata);
        src/pokenav_ribbons_summary.o(.rodata);
        src/pokenav_match_call_data.o(.rodata);
        src/menu_specialized.o(.rodata);
        src/ereader_helpers.o(.rodata);
        src/faraway_island.o(.rodata);
        src/ereader_screen.o(.rodata);
        src/trainer_hill.o(.rodata);
        src/rayquaza_scene.o(.rodata);
        src/walda_phrase.o(.rodata);
        src/gym_leader_rematch.o(.rodata);
        src/battle_transition_frontier.o(.rodata);
        src/text_input_strings.o(.rodata);
        src/fonts.o(.rodata);
        src/international_string_util.o(.rodata);
        src/mystery_event_msg.o(.rodata);
        data/mystery_gift.o(.rodata);
        src/m4a_tables.o(.rodata);
        data/sound_data.o(.rodata);
        src/pokemon_debug.o(.rodata);
        src/expansion_intro.o(.rodata);
    } > ROM =0

    song_data :
    ALIGN(4)
    {
        sound/songs/*.o(.rodata);
    } > ROM =0

    lib_rodata :
    SUBALIGN(4)
    {
        src/m4a.o(.rodata);
        src/agb_flash.o(.rodata);
        src/agb_flash_1m.o(.rodata);
        src/agb_flash_mx.o(.rodata);
        src/agb_flash_le.o(.rodata);
        src/siirtc.o(.rodata);
        src/librfu_rfu.o(.rodata);
        src/librfu_sio32id.o(.rodata);
        *libgcc.a:_divdi3.o(.rodata);
        *libgcc.a:_udivdi3.o(.rodata);
        *libc.a:memcpy.o(.rodata);
        *libc.a:memset.o(.rodata);
        *libc.a:strcmp.o(.rodata);
        *libc.a:strcpy.o(.rodata);
        *libc.a:impure.o(.rodata);
        *libc.a:vsprintf.o(.rodata);
        *libc.a:vfprintf.o(.rodata);
        *libc.a:wsetup.o(.rodata);
        *libc.a:dtoa.o(.rodata);
        *libc.a:fflush.o(.rodata);
        *libc.a:findfp.o(.rodata);
        *libc.a:freer.o(.rodata);
        *libc.a:mtrim.o(.rodata);
        *libc.a:fvwrite.o(.rodata);
        *libc.a:fwalk.o(.rodata);
        *libc.a:locale.o(.rodata);
        *libc.a:makebuf.o(.rodata);
        *libc.a:mallocr.o(.rodata);
        *libc.a:mbtowc_r.o(.rodata);
        *libc.a:memchr.o(.rodata);
        *libc.a:memmove.o(.rodata);
        *libc.a:mlock.o(.rodata);
        *libc.a:mprec.o(.rodata);
        *libc.a:s_isinf.o(.rodata);
        *libc.a:s_isnan.o(.rodata);
        *libc.a:sbrkr.o(.rodata);
        *libc.a:stdio.o(.rodata);
        *libc.a:strlen.o(.rodata);
        *libc.a:syscalls.o(.rodata);
        *libc.a:writer.o(.rodata);
        *libc.a:callocr.o(.rodata);
        *libc.a:closer.o(.rodata);
        *libc.a:errno.o(.rodata);
        *libc.a:fstatr.o(.rodata);
        *libc.a:libcfunc.o(.rodata);
        *libc.a:lseekr.o(.rodata);
        *libc.a:readr.o(.rodata);
        src/libisagbprn.o(.rodata);
    } > ROM =0

    multiboot_data :
    ALIGN(4)
    {
        data/multiboot_ereader.o(.rodata);
        data/multiboot_berry_glitch_fix.o(.rodata);
        data/multiboot_pokemon_colosseum.o(.rodata);
    } > ROM =0

    gfx_data :
    ALIGN(4)
    {
        src/graphics.o(.rodata);
    } > ROM =0

    extra :
    ALIGN(4)
    {
        src/*.o(.text);
        gflib/*.o(.text);
        src/*.o(.rodata);
        gflib/*.o(.rodata);
        data/*.o(.rodata);
    } > ROM = 0

    .data.iwram :
    ALIGN(4)
    {
        __iwram_lma = .;
        . = . + (__iwram_end - __iwram_start);
    } > ROM = 0

    .data.ewram :
    ALIGN(4)
    {
        __ewram_lma = .;
        . = . + (__ewram_end - __ewram_start);
    } > ROM = 0

    __rom_end = .;

    /* DWARF debug sections.
       Symbols in the DWARF debugging sections are relative to the beginning
       of the section so we begin them at 0.  */

    /* DWARF 1 */
    .debug          0 : { *(.debug) }
    .line           0 : { *(.line) }

    /* GNU DWARF 1 extensions */
    .debug_srcinfo  0 : { *(.debug_srcinfo) }
    .debug_sfnames  0 : { *(.debug_sfnames) }

    /* DWARF 1.1 and DWARF 2 */
    .debug_aranges  0 : { *(.debug_aranges) }
    .debug_pubnames 0 : { *(.debug_pubnames) }

    /* DWARF 2 */
    .debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
    .debug_abbrev   0 : { *(.debug_abbrev) }
    .debug_line     0 : { *(.debug_line) }
    .debug_frame    0 : { *(.debug_frame) }
    .debug_str      0 : { *(.debug_str) }
    .debug_loc      0 : { *(.debug_loc) }
    .debug_macinfo  0 : { *(.debug_macinfo) }

    /* Discard everything not specifically mentioned above. */
    /DISCARD/ :
    {
        *(*);
    }
}
