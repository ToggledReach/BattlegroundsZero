local swingSpeed = {
    Activated = false,
    Keybind = Enum.KeyCode.V,

    SwingSpeed = 1,
    HitCooldown = 0.55,
}

function setSwingSpeed(speed)
    local currentSwingSpeed = gg.kopis.getSwingSpeed()
    if not currentSwingSpeed then
        return
    end
    for i,v in pairs(currentSwingSpeed) do
        currentSwingSpeed[i] = speed
    end
end

function swingSpeed:On()
    setSwingSpeed(swingSpeed.SwingSpeed)
end

function swingSpeed:Off()
    setSwingSpeed(1)
end

-- Creating a slider

local newSlider = gg.slider.new(gg.ui:WaitForChild("Menu").Settings.swingSpeed.SwingSlider, 0, 2, 0.1) -- min, max, round

newSlider:Bind(function(val)
    swingSpeed.SwingSpeed = val
    setSwingSpeed(val)
end)

local label

UserInputService.InputBegan:connect(function(input)
    local TextBoxFocused = UserInputService:GetFocusedTextBox()
    if TextBoxFocused then return end
    local KeyCode = input.KeyCode
    if KeyCode == swingSpeed.Keybind then
        if swingSpeed.Activated == false then
            swingSpeed:On()

            if label then
                label:Destroy()
                label = nil
            end

            label = gg.ui.Templates.TextLabel:Clone()
            label.Text = "Swing Modifier"
            label.Parent = gg.ui.Overlay:WaitForChild("Active")
            label.Visible = true
        else
            swingSpeed:Off()

            if label then
                label:Destroy()
                label = nil
            end
        end
        swingSpeed.Activated = not swingSpeed.Activated
    end
end)

return swingSpeed