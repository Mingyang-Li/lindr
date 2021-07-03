import React from 'react';
import { createStyles, Theme, makeStyles } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';
import { Link } from 'react-router-dom';

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    margin: {
      margin: theme.spacing(1),
    },
    extendedIcon: {
      marginRight: theme.spacing(1),
    },
  }),
);

const SignInBtn: React.FC = () => {
  const classes = useStyles();

  return (
    <Link to="/swipe" style={{ textDecoration: 'none' }}>
        <Button variant="outlined" color="secondary" className={classes.margin} fullWidth>
            Sign In
        </Button>
    </Link>
  );
}
export default SignInBtn;
