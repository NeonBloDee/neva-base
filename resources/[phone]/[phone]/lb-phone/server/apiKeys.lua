-- Webhook for instapic posts, recommended to be a public channel
INSTAPIC_WEBHOOK = "https://canary.discord.com/api/webhooks/"
-- Webhook for birdy posts, recommended to be a public channel
BIRDY_WEBHOOK = "https://canary.discord.com/api/webhooks/"

-- Discord webhook for server logs
LOGS = {
    Calls = "https://ptb.discord.com/api/webhooks/1315640081381589043/xGQMdZw-O7KXcG9IX9NKMT85IA_MrEoT4pZhTEeOHKvjuCIC5kiMc9ULN3oxW78wELBD", -- set to false to disable
    Messages = "https://ptb.discord.com/api/webhooks/1315640166056071190/lphNi7qKHLs-2rGHGFNOz3BxORR9iIQm12MMlXmqd1xyhSGQTWGZJXlW0WDBIbxucj4G",
    InstaPic = "https://discord.com/api/v10/webhooks/1281291491519762484/S2FmmZo5zd79UMTnVyJ53r84LOmIIPnOY5emsQ3LlcYys_5WsXVLHO6Pv6TreejLlT1k",
    Birdy = "https://discord.com/api/v10/webhooks/1281291503599226973/ACOcm9QfLzOZg__mzfUHSeS5Q1e7Kbceyj9vjPBtqpa6fBCgeavfH8IBf-gUKmkjU7cH",
    YellowPages = "https://discord.com/api/v10/webhooks/1281291510024900669/uefStzg0YkoYiXKhzj42QL2tG2gKd1TR_qh92exjWjsSbsSCxGoEuANwmk6b1X2DdzYZ",
    Marketplace = "https://discord.com/api/v10/webhooks/1281291520594411637/AZr96cyYa_Ucvpy-LhF82Sgmm0iigB5kI9NTGcEvKLO_TXeHyEXnFMtS09XJ_6j5usFv",
    Mail = "https://discord.com/api/v10/webhooks/1281291531537616917/kEYXZTvfOOvQ7cKKdFzUow-XqDCBT0Q0cPvSIUwHJGMJOglTFj7J2SIngU4e1XHotUaN",
    Wallet = "https://ptb.discord.com/api/webhooks/1315640257252818946/zRItQOJUh73zSSjkozWwGDgAt4tsTv-jHdcCy-6JyMs7t392BcFitCUmBe8r6vPfIYuS",
    DarkChat = "https://discord.com/api/v10/webhooks/1281291557298770073/Lr_ZUEHRXMfQ-CUp9v_hYD5jdPExTTLrgMQEUX2HQvSd0sJo74xA05R6_TR5-aKFhdTD",
    Services = "https://discord.com/api/v10/webhooks/1281291563506597889/iThrarchIOyZAFAu1S3ah6BCUDrRcCn_MxCYqV1wcebQt5vXvYPVt4_KgsD4h8sG7Jf5",
    Crypto = "https://discord.com/api/v10/webhooks/1281291573631647764/FauhAqiMHFqG8E7lUYM6F0etUbJXKKuqyR8oYVCYtLBGDhXuGnwPRUKqObb2EdsYrgx7",
    Trendy = "https://discord.com/api/v10/webhooks/1281291584255819828/TNTKw4zgXlz8W35C3m06wFLe8rli2oJplyHc_0sztQVVI3DkxD7X_rXP3DfFCFY2__9c",
    Uploads = "https://discord.com/api/v10/webhooks/1281291594611429482/OeCZNC_13TKGz92rUxpG697VcziZVLxQfGBK9xKhHgIfKl5rFhBoMLHxsDgDQllm10-l" -- all camera uploads will go here
}

-- Set your API keys for uploading media here.
-- Please note that the API key needs to match the correct upload method defined in Config.UploadMethod.
-- The default upload method is Fivemanage
-- We STRONGLY discourage using Discord as an upload method, as uploaded files may become inaccessible after a while.
-- You can get your API keys from https://fivemanage.com/
-- A video tutorial for how to set up Fivemanage can be found here: https://www.youtube.com/watch?v=y3bCaHS6Moc
API_KEYS = {
    Video = "R7V0fHMkWW5pYebDCQI7xx14oYiaBesU",
    Image = "VuJKHLbV80rh6lbCyq90LvgBNDfGF6na",
    Audio = "I3P8Q1nWSF1sysHqtvLod15dOC0ujZiw",
}
