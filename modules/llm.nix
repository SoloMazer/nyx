{ pkgs, ... }:
{
  # services.ollama = {
  #   enable = true;
  #   acceleration = "rocm";
  #   environmentVariables = {
  #     HCC_AMDGPU_TARGET = "gfx90c";
  #   };
  #   rocmOverrideGfx = "9.0.c"; 
  # };

  environment.systemPackages = with pkgs; [
    (alpaca.override {
      ollama = pkgs.ollama-rocm;
    })
  ];
  # hardware.opengl.extraPackages = [ pkgs.rocm-opencl-runtime ];

}
