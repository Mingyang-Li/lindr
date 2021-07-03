import React, { ReactElement } from 'react';
import GlobalContext from './contexts/GlobalContext';
import { ThemeProvider as MuiThemeProvider } from "@material-ui/core/styles";
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Login from './pages/auth/Login';
import Profile from './pages/account/Profile';
import Messaging from './pages/chat/Messaging';
import CreditCardSync from './pages/integration/CreditCardSync';
import LinkedInSync from './pages/integration/LinkedInSync';
import theme from './theme/theme';
import Container from '@material-ui/core/Container';


interface routeData {
  path: string | string[];
  component: ReactElement;
  exact?: boolean;
} 

const App: React.FC = () => {
  const store = {"key": "value"};
  const routes: routeData[] = [
    {
      path: "/",
      component: <Login />,
      exact: true
    },
    {
      path: "/profile",
      component: <Profile />,
      exact: true
    },
    {
      path: "/messaging",
      component: <Messaging />,
      exact: true
    },
    {
      path: "/creditcardsync",
      component: <CreditCardSync />,
      exact: true
    },
    {
      path: "/linkedinsync",
      component: <LinkedInSync />,
      exact: true
    }
  ];
  return (
    <div className="App">
      <GlobalContext.Provider value={store}>
        <MuiThemeProvider theme={theme}>
          <Container maxWidth="lg">
            <Router>
              <Switch>
                {routes.map((r, i) => (
                  <Route key={i} path={r.path} exact={r.exact} render={() => r.component} />
                ))}
              </Switch>
            </Router>
          </Container>
        </MuiThemeProvider>
      </GlobalContext.Provider>
    </div>
  );
}
export default App;
