# Como simular o circuito

1. Com o Quartus aberto, vá em `File > Open Project...` e selecione o arquivo `quartus/projeto.qpf`.
2. Compile o projeto com `Processing > Start Compilation`.
3. Verifique se a ferramenta de simulação selecionada é a `ModelSim-Altera` em `Assignments > Settings > EDA Tool Settings > Simulation > Tool name`.
4. Adicione o caminho correto para a ferramenta de simulação em `Tools > Options > EDA Tool Options` na caixa correspondente ao ModelSim-Altera, como por exemplo o caminho `C:\intelFPGA_lite\20.1\modelsim_ase\win32aloem\`.
5. Clique em `Tools > Run Simulation Tool > RTL Simulation`.

## Específico do circuito: alterar a operação a ser realizada

1. Selecione com o botão direito o objeto `op` e clique em `Modify > Apply Wave...`.
2. Na janela, clique em `counter` e então `Next > Finish`.
3. Clique em ContinueRun na janela de simulação.