-- ✅ Blue Lock Auto Reroll Script Principal (Custom)
-- Desenvolvido por KamadoExxeHub

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- Configurações
local stylesDesejados = _G.Styles or {}
local flowsDesejados = _G.Flows or {}
local slot = _G.Slot or "Slot1"
local luckySpin = _G.LuckySpin or false
local usarMoney = _G.Money or false
local maxSpins = _G.MaxSpins or 10
local tempoRollback = _G.TimeToRollback or 5

-- Remotes (ajustar os nomes reais se necessário)
local rerollRemote = ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("StyleReroll")
local rollbackRemote = ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("RollbackStyle")

-- Função de checagem
local function contemNaLista(lista, valor)
    for _, v in ipairs(lista) do
        if v:lower() == valor:lower() then
            return true
        end
    end
    return false
end

-- Obter valores atuais
local function getEstilo()
    return LocalPlayer:FindFirstChild("Style") and LocalPlayer.Style.Value or ""
end

local function getFlow()
    return LocalPlayer:FindFirstChild("Flow") and LocalPlayer.Flow.Value or ""
end

-- Log de início
print("🌀 Iniciando Auto Reroll - Slot:", slot)

-- Salvar estilo/flow original
local estiloOriginal = getEstilo()
local flowOriginal = getFlow()

local tentativa = 0

while tentativa < maxSpins do
    tentativa += 1
    print("🔁 Tentativa", tentativa)

    if rerollRemote then
        rerollRemote:FireServer({
            ["Slot"] = slot,
            ["UseMoney"] = usarMoney,
            ["LuckySpin"] = luckySpin
        })
    else
        warn("❌ Remote de reroll não encontrado.")
        break
    end

    task.wait(2)

    local estiloAtual = getEstilo()
    local flowAtual = getFlow()

    print("🎯 Estilo:", estiloAtual, "| Flow:", flowAtual)

    if contemNaLista(stylesDesejados, estiloAtual) and contemNaLista(flowsDesejados, flowAtual) then
        print("✅ Estilo e Flow desejados obtidos!")
        break
    end
end

-- Rollback se falhar
if not (contemNaLista(stylesDesejados, getEstilo()) and contemNaLista(flowsDesejados, getFlow())) then
    print("🔄 Não obteve o desejado. Revertendo para original em", tempoRollback, "segundos.")
    task.wait(tempoRollback)

    if rollbackRemote then
        rollbackRemote:FireServer({["Slot"] = slot})
        print("↩️ Rollback enviado.")
    else
        warn("⚠️ Remote de rollback não encontrado.")
    end
end
