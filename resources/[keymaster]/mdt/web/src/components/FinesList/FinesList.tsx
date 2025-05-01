import React, { useState, useEffect } from 'react';
import type { RootState } from '@/store';
import { useSelector, useDispatch } from 'react-redux';
import { setActiveModal } from '@/slices/globalSlice';

import AddFinesModal from '@/modals/AddFinesModal';
import Button from '@/components/Button';
import Table from '@/components/Table';
import Loader from '@/components/Loader';

import './FinesList.scss';

const FinesList = () => {
  const { fines, isFetched } = useSelector((state: RootState) => state.finesSlice);
  const { info, permissions } = useSelector((state: RootState) => state.globalSlice);
  const { policeRank } = info;
  const [isLoading, setIsLoading] = useState<boolean>(true);
  const dispatch = useDispatch();

  const tableColumns = [
    {
      name: "Nom de l'amende",
    },
    {
      name: 'Durée de peine',
    },
    {
      name: 'Montant',
    },
    {
      name: 'Ajouté par',
    },
  ];

  useEffect(() => {
    setIsLoading(false);
  }, [fines]);

  console.log('policeRank:', policeRank, 'permissions.addFines:', permissions.addFines);

  return (
    <>
      <AddFinesModal />

      <section className="fines-list">
        <div className="fines-list__header">
          <div className="d-flex align-items-center">
            <div className="section-line section-line--blue"></div>

            <h3 className="section-title">
              <span className="text-extrabold">Liste</span> des amendes
            </h3>
          </div>

          {permissions.addFines.includes(policeRank) && (
            <Button
              onClick={() => dispatch(setActiveModal('add-fines'))}
              theme="purple"
              size="medium"
            >
              Ajouter une amende
            </Button>
          )}
        </div>

        <div className="fines-list__main">
          {isLoading && isFetched === 0 ? (
            <Loader />
          ) : (
            <Table columns={tableColumns} data={fines} />
          )}
        </div>
      </section>
    </>
  );
};

export default FinesList;
