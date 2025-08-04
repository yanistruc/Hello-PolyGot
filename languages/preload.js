const { contextBridge, ipcRenderer } = require('electron')

contextBridge.exposeInMainWorld('electronAPI', {
  print: (msg) => ipcRenderer.send('print-message', msg),
  close: () => ipcRenderer.send('close')
})
