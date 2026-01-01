import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { ProgressProvider } from './context/ProgressContext';
import GradeSelect from './pages/GradeSelect';
import Home from './pages/Home';
import Learning from './pages/Learning';
import Review from './pages/Review';
import Collection from './pages/Collection';
import Result from './pages/Result';
import Settings from './pages/Settings';

// Wrapper to check if grade is selected
function RequireGrade({ children }: { children: React.ReactNode }) {
  // If no grade is set and no saved progress, redirect to grade select
  const hasProgress = localStorage.getItem('kokki-zukan-progress');
  if (!hasProgress) {
    return <Navigate to="/" replace />;
  }

  return <>{children}</>;
}

function AppRoutes() {
  return (
    <Routes>
      <Route path="/" element={<GradeSelect />} />
      <Route
        path="/home"
        element={
          <RequireGrade>
            <Home />
          </RequireGrade>
        }
      />
      <Route
        path="/learning"
        element={
          <RequireGrade>
            <Learning />
          </RequireGrade>
        }
      />
      <Route
        path="/review"
        element={
          <RequireGrade>
            <Review />
          </RequireGrade>
        }
      />
      <Route
        path="/collection"
        element={
          <RequireGrade>
            <Collection />
          </RequireGrade>
        }
      />
      <Route
        path="/result"
        element={
          <RequireGrade>
            <Result />
          </RequireGrade>
        }
      />
      <Route
        path="/settings"
        element={
          <RequireGrade>
            <Settings />
          </RequireGrade>
        }
      />
    </Routes>
  );
}

export default function App() {
  return (
    <BrowserRouter>
      <ProgressProvider>
        <AppRoutes />
      </ProgressProvider>
    </BrowserRouter>
  );
}
