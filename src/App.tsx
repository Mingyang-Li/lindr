import React, { ReactElement } from 'react';
import GlobalContext from './contexts/GlobalContext';
import { ThemeProvider as MuiThemeProvider } from "@material-ui/core/styles";
import Login from './pages/auth/Login';

interface routeData {
  path: string | string[];
  component: ReactElement;
  exact?: boolean;
}

const App: React.FC = () => {
  const store = {"key": "value"};
  const routes: routeData[] = [
    {
      path: "path",
      component: <Login />,
      exact: true
    }
  ];
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
