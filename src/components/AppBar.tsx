import React from 'react';
import { Router, Link } from 'react-router-dom';
import { makeStyles } from '@material-ui/core/styles';
import BottomNavigation from '@material-ui/core/BottomNavigation';
import BottomNavigationAction from '@material-ui/core/BottomNavigationAction';
import PersonIcon from '@material-ui/icons/Person';
import LoyaltyIcon from '@material-ui/icons/Loyalty';
import FavoriteIcon from '@material-ui/icons/Favorite';
import ChatBubbleIcon from '@material-ui/icons/ChatBubble';

const useStyles = makeStyles({
  root: {
    width: 500,
  },
});

const AppBar: React.FC = () => {
  const classes = useStyles();
  const [value, setValue] = React.useState('recents');

  const handleChange = (event: React.ChangeEvent<{}>, newValue: string) => {
    setValue(newValue);
  };

  return (
    <BottomNavigation value={value} onChange={handleChange} className={classes.root}>
      <BottomNavigationAction label="Lindr" value="recents" icon={<LoyaltyIcon />} />
      <BottomNavigationAction label="Favorites" value="favorites" icon={<FavoriteIcon />} />
      {/* <Link to={'/login'}> */}
        <BottomNavigationAction label="DMs" value="dms" icon={<ChatBubbleIcon />} />
      {/* </Link> */}
      <BottomNavigationAction label="Profile" value="folder" icon={<PersonIcon />} />
    </BottomNavigation>
  );
}
export default AppBar;
