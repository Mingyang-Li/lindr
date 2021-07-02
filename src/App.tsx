import React from 'react';
import GlobalContext from './contexts/GlobalContext';
import { ThemeProvider as MuiThemeProvider } from "@material-ui/core/styles";

const App: React.FC = () => {
  const store = {"key": "value"};
  return (
    <div className="App">
      <GlobalContext.Provider value={store}>
        <MuiThemeProvider theme={store}>
          <p>App.js</p>
        </MuiThemeProvider>
      </GlobalContext.Provider>
    </div>
  );
}

export default App;
