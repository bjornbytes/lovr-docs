return {
  tag = "headset",
  summary = "Set the display refresh rate.",
  description = "Sets the display refresh rate, in Hz.",
  module = "lovr.headset",
  arguments = {
    {
      name = "frequency",
      type = "number",
      description = "The refresh rate to set, in Hz",
    }
  },
  returns = {
    {
      name = "success",
      type = "boolean",
      description = "Whether the display refresh rate was successfully set."
    }
  },
  notes = "Changing the display refresh-rate also changes the frequency of lovr.update() and lovr.draw() as they depend on the display frequency."
}
