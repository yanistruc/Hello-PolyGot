const { app, BrowserWindow, ipcMain } = require('electron')

app.disableHardwareAcceleration();

function createWindow() {
  const win = new BrowserWindow({
    width: 400,
    height: 300,
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true,
      preload: __dirname + '/preload.js'
    }
  })

  win.loadFile('languages/hello_html.html')

  ipcMain.on('print-message', (event, message) => {
    console.log(message)
  })

  ipcMain.on('close', () => {
    win.close()
    app.quit()
  })
}

app.whenReady().then(createWindow)

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit()
})
