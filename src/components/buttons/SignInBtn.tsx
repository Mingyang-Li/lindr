import React from 'react';
import { createStyles, Theme, makeStyles } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';

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
    <div>
      <Button variant="outlined" size="medium" color="secondary" className={classes.margin}>
        Sign In
    </Button>
    </div>
  );
}
export default SignInBtn;
