-- ✅ Blue Lock: Auto Style & Flow Personalizado
-- Launcher criado por KamadoExxeHub

-- 🎯 CONFIGURAÇÕES
_G.Styles = { "Kaiser", "Don Lorenzo" }        -- Estilos desejados
_G.Flows = { "Snake", "Prodigy" }              -- Flows desejados
_G.Slot = "Slot1"                              -- Slot a ser utilizado
_G.LuckySpin = false                           -- Usar Lucky Spin?
_G.Money = false                               -- Usar dinheiro no reroll?
_G.MaxSpins = 10                               -- Tentativas antes do rollback
_G.TimeToRollback = 5                          -- Tempo (em segundos) até rollback

-- 🚀 EXECUÇÃO DO SCRIPT PRINCIPAL
loadstring(game:HttpGet("https://raw.githubusercontent.com/SeuUsuarioGitHub/ExxeHub/main/BlueLockAutoRoll_Custom.lua"))()
