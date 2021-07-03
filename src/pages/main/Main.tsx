import React from 'react';
import AppBar from '../../components/AppBar';
import { Route, Switch } from 'react-router';
import { Link } from 'react-router-dom';
import Swipe from '../main/Swipe';
import Messaging from '../chat/Messaging';
import Profile from '../account/Profile';

interface MainProps {}

const Main: React.FC<MainProps> = () => {
    return (
        <>
            <Switch>
                <Route path={'/swipe'} render={() => <Swipe />} exact />
                <Route path={'/messaging'} render={() => <Messaging />} exact />
                <Route path={'/profile'} render={() => <Profile />} exact />
            </Switch>
            <AppBar />
        </>
    )
}