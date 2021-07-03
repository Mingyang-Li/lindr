import React from 'react';
import loginImg from '../../assets/login.png';
import Typography from '@material-ui/core/Typography';
import SignUpBtn from '../../components/buttons/SignUpBtn';
import SignInBtn from '../../components/buttons/SignInBtn';

const Login: React.FC = () => {
    return (
        <>
            <Typography variant="h1">Lindr.</Typography>
            <Typography variant="h4">Pefecting your work-love balance</Typography>
            <SignInBtn />
            <SignUpBtn />
            <img src={loginImg} />
        </>
    )
};

export default Login;