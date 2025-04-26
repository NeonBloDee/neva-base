SunnyDrugs = {
    Wait = 2000,
    Drugs = {
        ["weed"] = {
            ["recolte"] = {
                vector3(1919.312744, 5094.442871, 43.461361),
                vector3(1914.445190, 5087.546875, 44.673885),
                vector3(1913.323486, 5091.880859, 44.556637),
                vector3(1910.880371, 5087.284668, 45.233173),
                vector3(1903.853271, 5084.025391, 46.523808),
                vector3(1905.220215, 5079.729004, 46.531624),
                vector3(1900.948853, 5078.585938, 47.285782),
                vector3(1897.983765, 5073.399414, 48.081326),
                vector3(1893.063843, 5074.910156, 48.803791)
            },
            ["recolte1"] = {
                vec3(-622.713745, 2918.835449, 14.733567),
                vec3(-631.917419, 2918.109131, 14.731487),
                vec3(-633.262024, 2911.316650, 15.138457),
                vec3(-613.661377, 2923.028320, 14.556289),
                vec3(-615.768738, 2909.480225, 15.426668)
            },
            ["traitement"] = {
                vector3(-191.656097, 6524.072754, -5.942028),
                vector3(-184.361359, 6528.739258, -5.942033),
                vector3(-181.701233, 6527.545410, -5.942031)
            }
        },

        ["meth_pills"] = {
            ["recolte"] = {
                vector3(5000, 5000, 5000)
            },
            ["traitement"] = {
                vec3(1389.103516, 3605.235352, 38.941891),
                vec3(1389.680908, 3603.434082, 38.941391),
                vec3(1394.410156, 3601.806396, 38.941933),
                vec3(1391.982910, 3605.867920, 38.941925),
                vec3(1389.801636, 3608.683838, 38.941925)
            }
        },

        ["coke"] = {
            ["recolte"] = {
                vector3(-746.621338, 4324.529297, 141.125916),
                vector3(-745.970642, 4319.456543, 140.938095),
                vector3(-750.725220, 4318.713867, 141.597076),
                vector3(-752.505249, 4314.186523, 142.247742),
                vector3(-747.882751, 4314.329590, 140.922272),
                vector3(-746.806885, 4324.418457, 141.149902)
            },
            ["recolte1"] = {
                vector3(5000, 5000, 5000)
            },
            ["traitement"] = {
                vector3(890.864746, -3021.854248, -11.377320),
                vector3(891.012024, -3026.396973, -11.377320),
                vector3(892.812561, -3028.579590, -11.377322),
                vector3(890.989624, -3035.947266, -11.377329),
                vector3(892.731750, -3024.136475, -11.377330)
            }
        },

        ["meth_pure"] = {
            ["recolte"] = {
                vector3(110.962494, -3212.895752, 7.541922),
                vector3(111.214401, -3215.941895, 7.541922),
                vector3(115.145325, -3217.537354, 6.006779),
                vector3(115.030968, -3213.720703, 6.010869),
                vector3(114.947060, -3209.265137, 6.010605)
            },
            ["recolte1"] = {
                vector3(5000, 5000, 5000)
            },
            ["recolte2"] = {
                vector3(5000, 5000, 5000)
            },
            ["recolte3"] = {
                vector3(5000, 5000, 5000)
            },
            ["recolte4"] = {
                vector3(5000, 5000, 5000)
            },
            ["traitement"] = {
                vector3(2925.513672, 4643.792969, 31.200911),
                vector3(2925.541260, 4640.873535, 31.200930),
                vector3(2922.610352, 4644.268066, 31.200932),
                vector3(2922.640381, 4647.073242, 31.200911),
                vector3(2925.443848, 4643.595215, 31.200911),
                vector3(2916.555420, 4651.605957, 31.200907)
            }
        }
    },
    Items = {
        ["weed"] = {
            ["recolte"] = {
                name = "weed",
                label = "Weed",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = false,
                props = "prop_weed_01"
            },
            ["recolte1"] = {
                name = "terre",
                label = "Terre",
                animtype = "anim",
                animdict = "random@burial",
                anim = "a_burial",
                animtime = 2000,
                marker = false,
                props = "prop_pile_dirt_01"
            },
            ["traitement"] = {
                name = "weed_pooch",
                label = "Pochon de weed",
                animtype = "scenario",
                animdict = "PROP_HUMAN_BUM_BIN",
                anim = nil,
                animtime = 5000,
                marker = true,
                props = nil
            }
        },
        ["coke"] = {
            ["recolte"] = {
                name = "feuillecoca",
                label = "Feuille de Coca",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = false,
                props = "prop_plant_fern_02a"
            },
            ["recolte1"] = {
                name = "hydrochloric_acid",
                label = "Acide Chlorhydrique",
                animtype = "anim",
                animdict = "random@burial",
                anim = "a_burial",
                animtime = 2000,
                marker = false,
                props = "proc_stones_01"
            },
            ["traitement"] = {
                name = "coke_pooch",
                label = "Pochon de coke",
                animtype = "scenario",
                animdict = "PROP_HUMAN_BUM_BIN",
                anim = nil,
                animtime = 5000,
                marker = true,
                props = nil
            }
        },
        ["meth_pure"] = {
            ["recolte"] = {
                name = "phosphorerouge",
                label = "Phosphore rouge",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = true,
                props = "hei_prop_drug_statue_box_big"
            },
            ["recolte1"] = {
                name = "kq_lithium",
                label = "Pack de lithium",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = true,
                props = nil
            },
            ["recolte2"] = {
                name = "kq_ethanol",
                label = "Éthanol",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = true,
                props = nil
            },
            ["recolte3"] = {
                name = "hydrochloric_acid",
                label = "Acide Chlorhydrique",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = true,
                props = nil
            },
            ["recolte4"] = {
                name = "pure_meth_pills",
                label = "Pseudoéphédrine Pure",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = true,
                props = nil
            },
            ["traitement"] = {
                name = "methpure",
                label = "Méthamphétamine Pure",
                animtype = "scenario",
                animdict = "PROP_HUMAN_BUM_BIN",
                anim = nil,
                animtime = 5000,
                marker = true,
                props = nil
            }
        },
        ["meth_pills"] = {
            ["recolte"] = {
                name = "kq_meth_pills",
                label = "Pseudoéphédrine",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = true,
                props = nil
            },
            ["traitement"] = {
                name = "pure_meth_pills",
                label = "Pseudoéphédrine Pure",
                animtype = "scenario",
                animdict = "PROP_HUMAN_BUM_BIN",
                anim = nil,
                animtime = 5000,
                marker = true,
                props = nil
            }
        }
    },
    RandomZone = {},
    x = {},
    y = {},
    z = {},
    objSpawn = {},
    
    Ped = {
        Model = "s_m_y_dealer_01", 
        SpawnDistance = {min = 5, max = 10}, 
        Blip = {
            Sprite = 1,
            Colour = 1, 
            Scale = 0.4,
            Name = "Client"
        }
    },

    SaleItems = {
        -- Simple
        {item = "weed_pooch", label = "Weed", props = "prop_weed_block_01", anim = {"mp_common", "givetake2_a"}, minmoney = 105, maxmoney = 125},
        {item = "coke_pooch", label = "Cocaïne", props = "prop_coke_block_half_b", anim = {"mp_common", "givetake2_a"}, minmoney = 110, maxmoney = 135},
        -- Avancé -- METH 27/01/2025
        {item = "methpure", label = "Méthamphétamine pure", props = "p_meth_bag_01_s", anim = {"mp_common", "givetake2_a"}, minmoney = 320, maxmoney = 350},
        {item = "cokepure", label = "Cocaïne pure", props = "p_meth_bag_01_s", anim = {"mp_common", "givetake2_a"}, minmoney = 230, maxmoney = 250},
        -- Camion
        {item = "kq_meth_low", label = "Méthamphétamine (Qualité basse)", props = "p_meth_bag_01_s", anim = {"mp_common", "givetake2_a"}, minmoney = 60, maxmoney = 75},
        {item = "kq_meth_mid", label = "Méthamphétamine (Qualité moyenne)", props = "p_meth_bag_01_s", anim = {"mp_common", "givetake2_a"}, minmoney = 75, maxmoney = 95},
        {item = "kq_meth_high", label = "Méthamphétamine (Haute qualité)", props = "p_meth_bag_01_s", anim = {"mp_common", "givetake2_a"}, minmoney = 95, maxmoney = 115}
    },

    BlackListedJobs = {
        ['police'] = true,
        ['saspn'] = true,
        ['ambulance'] = true,
        ['gouvernement'] = true
    },

    AuthorizedPositions = {
        {x = -1345.102051, y = -1270.704224, z = 4.894472}, -- Position 1
        {x = 274.033691, y = 150.604980, z = 104.416214}, -- Position 2
        {x = 897.672424, y = -2350.440918, z = 30.481197}, -- Position 3
        {x = -955.104431, y = -2593.844727, z = 13.847948}, -- Position 4
        {x = 1692.284180, y = 4772.341797, z = 41.921246}, -- Position 5
        {x = -221.599167, y = 6347.479004, z = 32.094200},  -- Position 6
        {x = 1013.566956, y = -687.470703, z = 56.743320},  -- Position 7
        {x = -1617.190796, y = 195.583511, z = 60.292656}  -- Position 8
    },

    Blip = {
        sprite = 304,
        display = 4,
        scale = 0.5,
        color = 5,
        name = "Zone Fréquentée"
    },

    DistanceToSell = 3.0,

    sell = {
        Position = {}
    }
}
